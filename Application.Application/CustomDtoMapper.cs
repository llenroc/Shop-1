using Application.Authorization.End.Users.Dto;
using Application.Authorization.Users;
using Application.Products;
using Application.Products.Tenants.Dto;
using AutoMapper;

namespace Application
{
    internal static class CustomDtoMapper
    {
        private static volatile bool _mappedBefore;
        private static readonly object SyncObj = new object();

        public static void CreateMappings(IMapperConfigurationExpression mapper)
        {
            lock (SyncObj)
            {
                if (_mappedBefore)
                {
                    return;
                }

                CreateMappingsInternal(mapper);

                _mappedBefore = true;
            }
        }

        private static void CreateMappingsInternal(IMapperConfigurationExpression mapper)
        {
            mapper.CreateMap<User, UserEditDto>()
                .ForMember(dto => dto.Password, options => options.Ignore())
                .ReverseMap()
                .ForMember(user => user.Password, options => options.Ignore());
            mapper.CreateMap<User, UserEditInput>()
               .ForMember(dto => dto.Password, options => options.Ignore())
               .ReverseMap()
               .ForMember(user => user.Password, options => options.Ignore());

            mapper.CreateMap<SpecificationForCreateOrEditInput, Specification>()
                .ForMember(dest => dest.PropertyValues, opt => opt.Ignore());

        }
    }
}
