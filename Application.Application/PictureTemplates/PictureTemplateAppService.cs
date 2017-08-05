using Application.PictureTemplates.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;

namespace Application.PictureTemplates
{
    public class PictureTemplateAppService 
        : CrudAppService<PictureTemplate, PictureTemplateDto>,
        IPictureTemplateAppService
    {
        private IRepository<TemplateParameter> _templateParameterRespository;
        public PictureTemplateAppService(
            IRepository<TemplateParameter> templateParameterRespository,
            IRepository<PictureTemplate> respository):base(respository)
        {
            _templateParameterRespository = templateParameterRespository;
        }

        public CreateOrEditPictureTemplateDto GetPictureTemplateForCreateOrEdit(NullableIdDto input)
        {
            CreateOrEditPictureTemplateDto spreadPosterTemplate = new CreateOrEditPictureTemplateDto();

            if (input.Id.HasValue)
            {
                spreadPosterTemplate = Repository.Get(input.Id.Value).MapTo<CreateOrEditPictureTemplateDto>();
            }
            return spreadPosterTemplate;
        }

        public CreateOrEditPictureTemplateDto CreateOrEdit(CreateOrEditPictureTemplateDto input)
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

                return entity.MapTo<CreateOrEditPictureTemplateDto>();
            }
            else
            {
                CheckCreatePermission();
                var entity = input.MapTo<PictureTemplate>();

                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                return entity.MapTo<CreateOrEditPictureTemplateDto>();
            }
        }
    }
}
