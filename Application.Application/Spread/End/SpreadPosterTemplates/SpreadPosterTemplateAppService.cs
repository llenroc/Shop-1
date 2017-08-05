using Application.Spread.SpreadPosters.SpreadPosterTemplates;
using Application.Spread.End.SpreadPosterTemplates.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Linq;
using Application.PictureTemplates;
using Application.PictureTemplates.Dto;

namespace Application.Spread.End.SpreadPosterTemplates
{
    public class SpreadPosterTemplateAppService 
        : CrudAppService<SpreadPosterTemplate, SpreadPosterTemplateDto>,
        ISpreadPosterTemplateAppService
    {
        private IRepository<TemplateParameter> _templateParameterRespository;
        public SpreadPosterTemplateAppService(
            IRepository<TemplateParameter> templateParameterRespository,
            IRepository<SpreadPosterTemplate> respository):base(respository)
        {
            _templateParameterRespository = templateParameterRespository;
        }

        public CreateOrEditSpreadPosterTemplateDto GetSpreadPosterTemplateForCreateOrEdit(NullableIdDto input)
        {
            CreateOrEditSpreadPosterTemplateDto spreadPosterTemplate = new CreateOrEditSpreadPosterTemplateDto();

            if (input.Id.HasValue)
            {
                spreadPosterTemplate = Repository.Get(input.Id.Value).MapTo<CreateOrEditSpreadPosterTemplateDto>();
            }
            return spreadPosterTemplate;
        }

        public void SetAsDefault(SpreadPosterGetInput input)
        {
            SpreadPosterTemplate currentDefault=Repository.GetAll().Where(model => model.IsDefault).FirstOrDefault();

            if (currentDefault != null)
            {
                currentDefault.IsDefault = false;
                Repository.Update(currentDefault);
            }
            SpreadPosterTemplate spreadPosterTemplate = Repository.Get(input.Id);
            spreadPosterTemplate.IsDefault = true;
            Repository.Update(spreadPosterTemplate);
        }

        public CreateOrEditSpreadPosterTemplateDto CreateOrEdit(CreateOrEditSpreadPosterTemplateDto input)
        {
            if (input.Id.HasValue)
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.Id.Value);
                ObjectMapper.Map(input, entity);

                List<TemplateParameter> templateParameters = new List<TemplateParameter>();

                foreach (TemplateParameterDto templateParameterDto in input.Parameters)
                {
                    if (templateParameterDto.Id.HasValue)
                    {
                        var templateParameterInDb = _templateParameterRespository.Get(templateParameterDto.Id.Value);
                        ObjectMapper.Map(templateParameterDto, templateParameterInDb);
                        templateParameters.Add(templateParameterInDb);
                    }
                    else
                    {
                        templateParameters.Add(
                            templateParameterDto.MapTo<TemplateParameter>()
                            );
                    }
                }
                entity.Parameters = templateParameters;
                CurrentUnitOfWork.SaveChanges();

                return entity.MapTo<CreateOrEditSpreadPosterTemplateDto>();
            }
            else
            {
                CheckCreatePermission();
                var entity = input.MapTo<SpreadPosterTemplate>();

                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                return entity.MapTo<CreateOrEditSpreadPosterTemplateDto>();
            }
        }
    }
}
