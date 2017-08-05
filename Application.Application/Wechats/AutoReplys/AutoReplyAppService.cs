using Application.Wechats.AutoReplys.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Application.Wechats.AutoReplys;
using Utility.Web;

namespace Application.AutoReplys.AutoReplys
{
    public class AutoReplyAppService : CrudAppService<AutoReply, AutoReplyDto>, IAutoReplyAppService
    {
        private IRepository<AutoReplyArticle> _autoReplyArticleRespository;

        public AutoReplyAppService(
            IRepository<AutoReplyArticle> autoReplyArticleRespository,
            IRepository<AutoReply> respository):base(respository)
        {
            _autoReplyArticleRespository = autoReplyArticleRespository;
        }

        public override ListResultDto<AutoReplyDto> GetAll()
        {
            CheckGetAllPermission();
            var entities = Repository.GetAll().OrderBy(model=>model.Sort).ToList();
            return new ListResultDto<AutoReplyDto>(entities.Select(MapToEntityDto).ToList());
        }

        public AutoReplyForCreateOrEditInput GetAutoReplyForCreateOrEdit(NullableIdDto input)
        {
            AutoReplyForCreateOrEditInput autoReplyForCreateOrEditInput = new AutoReplyForCreateOrEditInput();

            if (input.Id.HasValue)
            {
                autoReplyForCreateOrEditInput.AutoReply = Repository.Get(input.Id.Value).MapTo<AutoReplyForCreateOrEditDto>();
                autoReplyForCreateOrEditInput.Articles = _autoReplyArticleRespository.GetAll()
                    .Where(model => model.AutoReplyId == input.Id.Value).ToList().MapTo<List<AutoReplyArticleForCreateOrEditDto>>();
            }
            else
            {
                autoReplyForCreateOrEditInput.AutoReply = new AutoReplyForCreateOrEditDto();
            }
            return autoReplyForCreateOrEditInput;
        }
        public void CreateOrEdit(AutoReplyForCreateOrEditInput input)
        {
            if (input.AutoReply.Id.HasValue)
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.AutoReply.Id.Value);
                ObjectMapper.Map(input.AutoReply, entity);
                CurrentUnitOfWork.SaveChanges();

                if (input.Articles == null)
                {
                    return;
                }
                foreach (AutoReplyArticleForCreateOrEditDto autoReplyArticleDto in input.Articles)
                {
                    ProcessArticle(autoReplyArticleDto);

                    if (autoReplyArticleDto.Id.HasValue)
                    {
                        var autoReplyArticle = _autoReplyArticleRespository.Get(autoReplyArticleDto.Id.Value);
                        ObjectMapper.Map(autoReplyArticleDto, autoReplyArticle);
                        CurrentUnitOfWork.SaveChanges();
                    }
                    else
                    {
                        var autoReplyArticle = autoReplyArticleDto.MapTo<AutoReplyArticle>();
                        autoReplyArticle.AutoReplyId = entity.Id;
                        _autoReplyArticleRespository.Insert(autoReplyArticle);
                        CurrentUnitOfWork.SaveChanges();
                    }
                }
            }
            else
            {
                CheckCreatePermission();
                var entity = input.AutoReply.MapTo<AutoReply>();

                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                if (input.Articles == null)
                {
                    return;
                }

                foreach (AutoReplyArticleForCreateOrEditDto autoReplyArticleDto in input.Articles)
                {
                    ProcessArticle(autoReplyArticleDto);

                    var autoReplyArticle = autoReplyArticleDto.MapTo<AutoReplyArticle>();
                    autoReplyArticle.AutoReplyId = entity.Id;
                    _autoReplyArticleRespository.Insert(autoReplyArticle);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        private void ProcessArticle(AutoReplyArticleForCreateOrEditDto autoReplyArticle)
        {
            if (string.IsNullOrEmpty(autoReplyArticle.PicUrl))
            {
                return;
            }

            if (autoReplyArticle.PicUrl.IndexOf("http://")==-1)
            {
                autoReplyArticle.PicUrl = UrlHelper.GetFullUrl(autoReplyArticle.PicUrl);
            }
        }

        public void RemoveArticle(IdInput input)
        {
            _autoReplyArticleRespository.Delete(input.Id);
        }
    }
}
