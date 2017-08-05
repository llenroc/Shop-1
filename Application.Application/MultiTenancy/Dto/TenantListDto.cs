using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;

namespace Application.MultiTenancy.Dto
{
    [AutoMapFrom(typeof(Tenant))]
    public class TenantListDto : EntityDto
    {
        public string TenancyName { get; set; }

        public string Name { get; set; }

        public string EditionDisplayName { get; set; }

        public string ConnectionString { get; set; }

        public bool IsActive { get; set; }

        public DateTime CreationTime { get; set; }
    }
}