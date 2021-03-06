﻿using Application.Channel.ChannelAgents;
using Application.Products.Tenants.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Channel.End.Dto
{
    [AutoMap(typeof(ChannelAgentAssortment))]
    public class ChannelAgentAssortmentDto : EntityDto
    {
        public int ChannelAgentId { get; set; }

        public SpecificationWithProductDto Specification { get; set; }

        public int SpecificationId { get; set; }

        public int Count { get; set; }
    }
}
