﻿using Application.Authorization;
using Application.Editions.Dto;
using Infrastructure;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Editions;
using Infrastructure.Authorization;
using Infrastructure.AutoMapper;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Editions
{
    [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostEditions)]
    public class EditionAppService : ApplicationAppServiceBase, IEditionAppService
    {
        private readonly EditionManager _editionManager;

        public EditionAppService(EditionManager editionManager)
        {
            _editionManager = editionManager;
        }

        public async Task<ListResultDto<EditionListDto>> GetEditions()
        {
            var editions = await _editionManager.Editions.ToListAsync();
            return new ListResultDto<EditionListDto>(editions.MapTo<List<EditionListDto>>());
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostEditions)]
        public async Task<GetEditionForEditOutput> GetEditionForEdit(NullableIdDto input)
        {
            var features = FeatureManager.GetAll();

            EditionEditDto editionEditDto;
            List<NameValue> featureValues;

            if (input.Id.HasValue) //Editing existing edition?
            {
                var edition = await _editionManager.FindByIdAsync(input.Id.Value);
                featureValues = (await _editionManager.GetFeatureValuesAsync(input.Id.Value)).ToList();
                editionEditDto = edition.MapTo<EditionEditDto>();
            }
            else
            {
                editionEditDto = new EditionEditDto();
                featureValues = features.Select(f => new NameValue(f.Name, f.DefaultValue)).ToList();
            }

            return new GetEditionForEditOutput
            {
                Edition = editionEditDto,
                Features = features.MapTo<List<FlatFeatureDto>>().OrderBy(f => f.DisplayName).ToList(),
                FeatureValues = featureValues.Select(fv => new NameValueDto(fv)).ToList()
            };
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostEditions)]
        public async Task CreateOrUpdateEdition(CreateOrUpdateEditionDto input)
        {
            if (!input.Edition.Id.HasValue)
            {
                await CreateEditionAsync(input);
            }
            else
            {
                await UpdateEditionAsync(input);
            }
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostEditions)]
        public async Task DeleteEdition(EntityRequestInput input)
        {
            var edition = await _editionManager.GetByIdAsync(input.Id);
            await _editionManager.DeleteAsync(edition);
        }

        public async Task<List<ComboboxItemDto>> GetEditionComboboxItems(int? selectedEditionId = null)
        {
            var editions = await _editionManager.Editions.ToListAsync();
            var editionItems = new ListResultDto<ComboboxItemDto>(editions.Select(e => new ComboboxItemDto(e.Id.ToString(), e.DisplayName)).ToList()).Items.ToList();

            var defaultItem = new ComboboxItemDto("null", L("NotAssigned"));
            editionItems.Insert(0, defaultItem);

            if (selectedEditionId.HasValue)
            {
                var selectedEdition = editionItems.FirstOrDefault(e => e.Value == selectedEditionId.Value.ToString());

                if (selectedEdition != null)
                {
                    selectedEdition.IsSelected = true;
                }
            }
            else
            {
                defaultItem.IsSelected = true;
            }

            return editionItems;
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostEditions)]
        protected virtual async Task CreateEditionAsync(CreateOrUpdateEditionDto input)
        {
            var edition = new Edition(input.Edition.DisplayName);

            await _editionManager.CreateAsync(edition);
            await CurrentUnitOfWork.SaveChangesAsync(); //It's done to get Id of the edition.

            await SetFeatureValues(edition, input.FeatureValues);
        }

        [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostEditions)]
        protected virtual async Task UpdateEditionAsync(CreateOrUpdateEditionDto input)
        {
            Debug.Assert(input.Edition.Id != null, "input.Edition.Id should be set.");

            var edition = await _editionManager.GetByIdAsync(input.Edition.Id.Value);
            edition.DisplayName = input.Edition.DisplayName;

            await SetFeatureValues(edition, input.FeatureValues);
        }

        private Task SetFeatureValues(Edition edition, List<NameValueDto> featureValues)
        {
            return _editionManager.SetFeatureValuesAsync(edition.Id, featureValues.Select(fv => new NameValue(fv.Name, fv.Value)).ToArray());
        }
    }
}
