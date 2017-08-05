namespace Application.Migrations
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity.Infrastructure.Annotations;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Addresses",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Code = c.String(),
                        Name = c.String(),
                        ParentId = c.Int(),
                        Level = c.Int(nullable: false),
                        DevelopLevel = c.Int(nullable: false),
                        Sort = c.Int(nullable: false),
                        EnglishName = c.String(),
                        ShortEnglishName = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Addresses", t => t.ParentId)
                .Index(t => t.ParentId);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        Number = c.String(nullable: false, maxLength: 32),
                        ShopId = c.String(),
                        Title = c.String(nullable: false),
                        OrderStatus = c.Int(nullable: false),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        PayMoney = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Score = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        PaymentStatus = c.Int(nullable: false),
                        PaymentDatetime = c.DateTime(),
                        PayType = c.Int(nullable: false),
                        RefundStatus = c.Int(nullable: false),
                        NoteOfCustomer = c.String(),
                        OutTradeNo = c.String(),
                        PrepayId = c.String(),
                        PrepayIdCreatedTime = c.DateTime(),
                        Postage = c.Decimal(nullable: false, precision: 18, scale: 2),
                        ShipStatus = c.Int(nullable: false),
                        ExpressCompanyId = c.Int(),
                        TrackingNumber = c.String(),
                        IsNeedShip = c.Boolean(nullable: false),
                        IsNeedLogistics = c.Boolean(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                        ChannelAgentRebate = c.Decimal(precision: 18, scale: 2),
                        DisableProductRebate = c.Boolean(),
                        DisableChannelAgentProductDistribution = c.Boolean(),
                        HasProcessMemberCardPackage = c.Boolean(),
                        HasProcessChannelAgencyApply = c.Boolean(),
                        ExchangeScore = c.Int(),
                        Discriminator = c.String(nullable: false, maxLength: 128),
                        MemberCardPackage_Id = c.Int(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AgentOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AgentOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgencyApplyOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgencyApplyOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgencyApplyOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgencyApplyOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_MemberCardPackageOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_MemberCardPackageOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Order_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Order_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ProductOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ProductOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ScoreExchangeOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ScoreExchangeOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ExpressCompanies", t => t.ExpressCompanyId)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .ForeignKey("dbo.MemberCardPackages", t => t.MemberCardPackage_Id)
                .Index(t => t.Number)
                .Index(t => t.OrderStatus)
                .Index(t => t.UserId)
                .Index(t => t.ExpressCompanyId)
                .Index(t => t.MemberCardPackage_Id);
            
            CreateTable(
                "dbo.ExpressCompanies",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        Icon = c.String(nullable: false),
                        Code = c.String(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ExpressCompany_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.OrderCustomCustomerInfoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CustomCustomerInfoId = c.Int(nullable: false),
                        Value = c.String(),
                        Order_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.CustomCustomerInfoes", t => t.CustomCustomerInfoId, cascadeDelete: true)
                .ForeignKey("dbo.Orders", t => t.Order_Id)
                .Index(t => t.CustomCustomerInfoId)
                .Index(t => t.Order_Id);
            
            CreateTable(
                "dbo.CustomCustomerInfoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductId = c.Int(nullable: false),
                        Name = c.String(),
                        Type = c.Int(nullable: false),
                        Required = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.ProductId);
            
            CreateTable(
                "dbo.OrderCustomerInfoes",
                c => new
                    {
                        OrderId = c.Int(nullable: false),
                        FullName = c.String(),
                        PhoneNumber = c.String(),
                        FullAddress = c.String(),
                        AddressId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.OrderId)
                .ForeignKey("dbo.Addresses", t => t.AddressId, cascadeDelete: true)
                .ForeignKey("dbo.Orders", t => t.OrderId)
                .Index(t => t.OrderId)
                .Index(t => t.AddressId);
            
            CreateTable(
                "dbo.User",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        Avatar = c.String(),
                        NickName = c.String(),
                        IsSpreader = c.Boolean(nullable: false),
                        ParentUserId = c.Long(),
                        ChannelAgencyId = c.Int(),
                        ChannelAgentDepth = c.Int(nullable: false),
                        IsChannelAgency = c.Boolean(nullable: false),
                        IsAreaAgency = c.Boolean(nullable: false),
                        UserChannelAgencyId = c.Int(),
                        ShouldChangePasswordOnNextLogin = c.Boolean(nullable: false),
                        ChildCountOfDepth1 = c.Int(nullable: false),
                        ChildCountOfDepth2 = c.Int(nullable: false),
                        ChildCountOfDepth3 = c.Int(nullable: false),
                        GroupCount = c.Int(nullable: false),
                        Sales = c.Decimal(nullable: false, precision: 18, scale: 2),
                        IsHide = c.Boolean(nullable: false),
                        Source = c.Int(nullable: false),
                        AuthenticationSource = c.String(maxLength: 64),
                        Name = c.String(nullable: false, maxLength: 32),
                        Surname = c.String(nullable: false, maxLength: 32),
                        Password = c.String(nullable: false, maxLength: 128),
                        IsEmailConfirmed = c.Boolean(nullable: false),
                        EmailConfirmationCode = c.String(maxLength: 328),
                        PasswordResetCode = c.String(maxLength: 328),
                        LockoutEndDateUtc = c.DateTime(),
                        AccessFailedCount = c.Int(nullable: false),
                        IsLockoutEnabled = c.Boolean(nullable: false),
                        PhoneNumber = c.String(),
                        IsPhoneNumberConfirmed = c.Boolean(nullable: false),
                        SecurityStamp = c.String(),
                        IsTwoFactorEnabled = c.Boolean(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        UserName = c.String(nullable: false, maxLength: 32),
                        TenantId = c.Int(),
                        EmailAddress = c.String(maxLength: 256),
                        LastLoginTime = c.DateTime(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_User_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_User_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.ParentUserId)
                .ForeignKey("dbo.User", t => t.CreatorUserId)
                .ForeignKey("dbo.User", t => t.DeleterUserId)
                .ForeignKey("dbo.User", t => t.LastModifierUserId)
                .Index(t => t.ParentUserId)
                .Index(t => t.DeleterUserId)
                .Index(t => t.LastModifierUserId)
                .Index(t => t.CreatorUserId);
            
            CreateTable(
                "dbo.UserClaim",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        UserId = c.Long(nullable: false),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserClaim_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.UserLogin",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        UserId = c.Long(nullable: false),
                        LoginProvider = c.String(nullable: false, maxLength: 128),
                        ProviderKey = c.String(nullable: false, maxLength: 256),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserLogin_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Permission",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        Name = c.String(nullable: false, maxLength: 128),
                        IsGranted = c.Boolean(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                        UserId = c.Long(),
                        RoleId = c.Int(),
                        Discriminator = c.String(nullable: false, maxLength: 128),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_PermissionSetting_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_RolePermissionSetting_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_UserPermissionSetting_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .ForeignKey("dbo.Role", t => t.RoleId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.UserRole",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        UserId = c.Long(nullable: false),
                        RoleId = c.Int(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserRole_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Setting",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        UserId = c.Long(),
                        Name = c.String(nullable: false, maxLength: 256),
                        Value = c.String(maxLength: 2000),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Setting_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.UserDetails",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        FullName = c.String(),
                        PhoneNumber = c.String(),
                        WechatName = c.String(),
                        IdentityNumber = c.String(),
                        User_Id = c.Long(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserDetail_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.User_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.WechatUserInfoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        OpenId = c.String(maxLength: 32),
                        UnionId = c.String(),
                        Nickame = c.String(),
                        Sex = c.Int(nullable: false),
                        Province = c.String(),
                        City = c.String(),
                        Country = c.String(),
                        HeadimgUrl = c.String(),
                        Privilege = c.String(),
                        Subscribe = c.Boolean(nullable: false),
                        SubscribeTime = c.Long(nullable: false),
                        User_Id = c.Long(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_WechatUserInfo_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.User_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.MemberCardPackages",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        Title = c.String(),
                        MemberLevelId = c.Int(nullable: false),
                        Expiry = c.Int(nullable: false),
                        Price = c.Int(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_MemberCardPackage_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_MemberCardPackage_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.MemberLevels", t => t.MemberLevelId, cascadeDelete: true)
                .Index(t => t.MemberLevelId);
            
            CreateTable(
                "dbo.MemberLevels",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        Name = c.String(nullable: false),
                        DisplayName = c.String(nullable: false, maxLength: 20),
                        Icon = c.String(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_MemberLevel_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.OrderItems",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        SpecificationId = c.Int(nullable: false),
                        CartItemId = c.Int(),
                        Count = c.Int(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        ShipStatus = c.Int(nullable: false),
                        IsCommented = c.Boolean(nullable: false),
                        IsGift = c.Boolean(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                        Comment_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ProductComments", t => t.Comment_Id)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .ForeignKey("dbo.Specifications", t => t.SpecificationId, cascadeDelete: true)
                .Index(t => t.OrderId)
                .Index(t => t.SpecificationId)
                .Index(t => t.Comment_Id);
            
            CreateTable(
                "dbo.ProductComments",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductId = c.Int(nullable: false),
                        OrderId = c.Int(nullable: false),
                        OrderItemId = c.Int(nullable: false),
                        Content = c.String(nullable: false, maxLength: 1024),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ProductComment_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.CreatorUserId)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.ProductId)
                .Index(t => t.CreatorUserId);
            
            CreateTable(
                "dbo.Specifications",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        ProductId = c.Int(nullable: false),
                        CardValue = c.String(),
                        Picture = c.String(),
                        Stock = c.Int(nullable: false),
                        Sale = c.Int(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Status = c.Int(nullable: false),
                        Number = c.String(),
                        Barcode = c.String(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Specification_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Specification_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.ProductId);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        Name = c.String(nullable: false),
                        FreightTemplateId = c.Int(),
                        Score = c.Int(nullable: false),
                        ExchangeScore = c.Int(nullable: false),
                        Weight = c.Single(nullable: false),
                        Content = c.String(),
                        Type = c.Int(nullable: false),
                        VirtualProductType = c.Int(nullable: false),
                        CardName = c.String(),
                        ShopId = c.Int(nullable: false),
                        ProductCategoryId = c.Int(nullable: false),
                        TemplateId = c.Int(nullable: false),
                        IsVirtual = c.Boolean(nullable: false),
                        EnableAgentOrder = c.Boolean(nullable: false),
                        Status = c.Int(nullable: false),
                        IsRedirectExternal = c.Boolean(nullable: false),
                        ExternalLink = c.String(),
                        ShareTitle = c.String(),
                        ShareDescription = c.String(),
                        SharePicture = c.String(),
                        MasterQrcode = c.String(),
                        IsAutoShip = c.Boolean(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Product_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Product_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.FreightTemplates", t => t.FreightTemplateId)
                .ForeignKey("dbo.ProductCategories", t => t.ProductCategoryId, cascadeDelete: true)
                .Index(t => t.FreightTemplateId)
                .Index(t => t.ProductCategoryId);
            
            CreateTable(
                "dbo.ChannelAgentProductDistributions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductId = c.Int(nullable: false),
                        Level = c.Int(nullable: false),
                        MaxChannelAgentLevel = c.Int(),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Ratio = c.Single(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.ProductId);
            
            CreateTable(
                "dbo.Distributions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductId = c.Int(nullable: false),
                        BuyWhen = c.Int(nullable: false),
                        Level = c.Int(nullable: false),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Ratio = c.Single(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.ProductId);
            
            CreateTable(
                "dbo.FreightTemplates",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        ValuationType = c.Int(nullable: false),
                        IsFreeShipping = c.Boolean(nullable: false),
                        FreightPlan = c.Int(nullable: false),
                        UnifiedFreight = c.Decimal(nullable: false, precision: 18, scale: 2),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_FreightTemplate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.DeliveryAreas",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FreightTemplateId = c.Int(nullable: false),
                        Addresses = c.String(),
                        FirstAmount = c.Single(nullable: false),
                        FirstFee = c.Decimal(nullable: false, precision: 18, scale: 2),
                        AdditionalAmount = c.Single(nullable: false),
                        AdditionalFee = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.FreightTemplates", t => t.FreightTemplateId, cascadeDelete: true)
                .Index(t => t.FreightTemplateId);
            
            CreateTable(
                "dbo.ProductCategories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        Name = c.String(),
                        Icon = c.String(),
                        ParentId = c.Int(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ProductCategory_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ProductCategory_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ProductCategories", t => t.ParentId)
                .Index(t => t.ParentId);
            
            CreateTable(
                "dbo.ProductProperties",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductId = c.Int(nullable: false),
                        Name = c.String(nullable: false),
                        Value = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.ProductId);
            
            CreateTable(
                "dbo.SpecificationProperties",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 64),
                        Description = c.String(maxLength: 256),
                        Type = c.Int(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.SpecificationPropertyValues",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        SpecificationId = c.Int(nullable: false),
                        SpecificationPropertyId = c.Int(nullable: false),
                        Value = c.String(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.SpecificationProperties", t => t.SpecificationPropertyId, cascadeDelete: true)
                .ForeignKey("dbo.Specifications", t => t.SpecificationId, cascadeDelete: true)
                .Index(t => t.SpecificationId)
                .Index(t => t.SpecificationPropertyId);
            
            CreateTable(
                "dbo.AreaAgencyApplyAddresses",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        AddressId = c.Int(nullable: false),
                        AreaAgencyApplyId = c.Int(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgencyApplyAddress_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Addresses", t => t.AddressId, cascadeDelete: true)
                .ForeignKey("dbo.AreaAgencyApplies", t => t.AreaAgencyApplyId, cascadeDelete: true)
                .Index(t => t.AddressId)
                .Index(t => t.AreaAgencyApplyId);
            
            CreateTable(
                "dbo.AreaAgencyApplies",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AreaAgentId = c.Int(nullable: false),
                        OrderId = c.Int(nullable: false),
                        Status = c.Int(nullable: false),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgencyApply_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgencyApply_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AreaAgents", t => t.AreaAgentId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.AreaAgentId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.AreaAgents",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Level = c.Int(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        NormalAddressRatio = c.Single(nullable: false),
                        RebateRatio = c.Single(nullable: false),
                        IndirectRebateRatio = c.Single(nullable: false),
                        Discount = c.Single(nullable: false),
                        TenantId = c.Int(nullable: false),
                        Name = c.String(),
                        PictureTemplateId = c.Int(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgent_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgent_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.AreaAgentDistributions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AreaAgentId = c.Int(nullable: false),
                        Level = c.Int(nullable: false),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Ratio = c.Single(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AreaAgents", t => t.AreaAgentId, cascadeDelete: true)
                .Index(t => t.AreaAgentId);
            
            CreateTable(
                "dbo.AreaAgencyAreas",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        AreaAgencyId = c.Int(nullable: false),
                        AddressId = c.Int(nullable: false),
                        DevelopLevel = c.Int(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgencyArea_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Addresses", t => t.AddressId, cascadeDelete: true)
                .ForeignKey("dbo.AreaAgencies", t => t.AreaAgencyId)
                .Index(t => t.AreaAgencyId)
                .Index(t => t.AddressId, unique: true);
            
            CreateTable(
                "dbo.AreaAgencies",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AreaAgentId = c.Int(nullable: false),
                        Level = c.Int(nullable: false),
                        TenantId = c.Int(nullable: false),
                        Number = c.String(),
                        UserId = c.Long(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgency_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgency_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AreaAgents", t => t.AreaAgentId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.AreaAgentId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.AreaAgentRebates",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AreaAgentId = c.Int(nullable: false),
                        AreaAgencyId = c.Int(nullable: false),
                        AreaAgentOrderRebateType = c.Int(nullable: false),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        OrderId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        BuyerUserId = c.Long(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AreaAgents", t => t.AreaAgentId, cascadeDelete: true)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .Index(t => t.AreaAgentId)
                .Index(t => t.OrderId);
            
            CreateTable(
                "dbo.ArticleHints",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                        ArticleId = c.Int(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ArticleHint_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Articles", t => t.ArticleId, cascadeDelete: true)
                .Index(t => t.ArticleId);
            
            CreateTable(
                "dbo.ArticleLikes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                        ArticleId = c.Int(nullable: false),
                        Like = c.Int(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ArticleLike_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Articles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        Title = c.String(nullable: false, maxLength: 200),
                        SubTitle = c.String(maxLength: 200),
                        Thumbnail = c.String(nullable: false, maxLength: 255),
                        Description = c.String(maxLength: 500),
                        Content = c.String(nullable: false),
                        Author = c.String(nullable: false, maxLength: 20),
                        Hint = c.Int(nullable: false),
                        Like = c.Int(nullable: false),
                        DisLike = c.Int(nullable: false),
                        CommentCount = c.Int(nullable: false),
                        KeyWord = c.String(maxLength: 20),
                        IsRedirectExternal = c.Boolean(nullable: false),
                        ExternalLink = c.String(maxLength: 255),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Article_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Article_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.AuditLog",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        UserId = c.Long(),
                        ServiceName = c.String(maxLength: 256),
                        MethodName = c.String(maxLength: 256),
                        Parameters = c.String(maxLength: 1024),
                        ExecutionTime = c.DateTime(nullable: false),
                        ExecutionDuration = c.Int(nullable: false),
                        ClientIpAddress = c.String(maxLength: 64),
                        ClientName = c.String(maxLength: 128),
                        BrowserInfo = c.String(maxLength: 256),
                        Exception = c.String(maxLength: 2000),
                        ImpersonatorUserId = c.Long(),
                        ImpersonatorTenantId = c.Int(),
                        CustomData = c.String(maxLength: 2000),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AuditLog_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.AutoReplyArticles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AutoReplyId = c.Int(nullable: false),
                        Title = c.String(nullable: false),
                        Description = c.String(nullable: false),
                        PicUrl = c.String(nullable: false),
                        Url = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AutoReplies", t => t.AutoReplyId, cascadeDelete: true)
                .Index(t => t.AutoReplyId);
            
            CreateTable(
                "dbo.AutoReplies",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        Name = c.String(nullable: false),
                        RequestType = c.Int(nullable: false),
                        MsgType = c.Int(nullable: false),
                        Content = c.String(),
                        Key = c.String(),
                        MatchingType = c.Int(nullable: false),
                        MediaId = c.String(),
                        Title = c.String(),
                        Description = c.String(),
                        MusicUrl = c.String(),
                        HQMusicUrl = c.String(),
                        ThumbMediaId = c.String(),
                        Sort = c.Int(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AutoReply_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AutoReply_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.BackgroundJob",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        JobType = c.String(nullable: false, maxLength: 512),
                        JobArgs = c.String(nullable: false),
                        TryCount = c.Short(nullable: false),
                        NextTryTime = c.DateTime(nullable: false),
                        LastTryTime = c.DateTime(),
                        IsAbandoned = c.Boolean(nullable: false),
                        Priority = c.Byte(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => new { t.IsAbandoned, t.NextTryTime });
            
            CreateTable(
                "dbo.ChannelAgencies",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ChannelAgentId = c.Int(nullable: false),
                        Depth = c.Int(nullable: false),
                        ChildCount = c.Int(nullable: false),
                        RebateRatio = c.Single(nullable: false),
                        TenantId = c.Int(nullable: false),
                        Number = c.String(),
                        UserId = c.Long(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ChannelAgency_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgency_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ChannelAgents", t => t.ChannelAgentId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.ChannelAgentId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.ChannelAgents",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        NickName = c.String(nullable: false),
                        AdWord = c.String(nullable: false),
                        AssortmentDiscription = c.String(),
                        Discription = c.String(),
                        Discount = c.Single(nullable: false),
                        Logo = c.String(nullable: false),
                        Level = c.Int(nullable: false),
                        RebateRatio = c.Single(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        MasterQrcode = c.String(),
                        TenantId = c.Int(nullable: false),
                        Name = c.String(),
                        PictureTemplateId = c.Int(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ChannelAgent_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgent_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ChannelAgentAssortments",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ChannelAgentId = c.Int(nullable: false),
                        SpecificationId = c.Int(nullable: false),
                        Count = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Specifications", t => t.SpecificationId, cascadeDelete: true)
                .ForeignKey("dbo.ChannelAgents", t => t.ChannelAgentId, cascadeDelete: true)
                .Index(t => t.ChannelAgentId)
                .Index(t => t.SpecificationId);
            
            CreateTable(
                "dbo.ChannelAgentDistributions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ChannelAgentId = c.Int(nullable: false),
                        Level = c.Int(nullable: false),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Ratio = c.Single(nullable: false),
                        NonAgencyRatio = c.Single(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ChannelAgents", t => t.ChannelAgentId, cascadeDelete: true)
                .Index(t => t.ChannelAgentId);
            
            CreateTable(
                "dbo.ChannelAgencyApplies",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        ChannelAgentId = c.Int(nullable: false),
                        Status = c.Int(nullable: false),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ChannelAgencyApply_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgencyApply_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ChannelAgents", t => t.ChannelAgentId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.ChannelAgentId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.ChannelAgentRebates",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        ChannlAgencyId = c.Int(nullable: false),
                        ChannelAgentId = c.Int(nullable: false),
                        RebateRatio = c.Single(nullable: false),
                        Depth = c.Int(nullable: false),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ChannelAgentRebate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ChannelAgents", t => t.ChannelAgentId, cascadeDelete: true)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .Index(t => t.OrderId)
                .Index(t => t.ChannelAgentId);
            
            CreateTable(
                "dbo.CustomerInfoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        FullName = c.String(nullable: false),
                        PhoneNumber = c.String(nullable: false),
                        DetailAddress = c.String(),
                        AddressId = c.Int(nullable: false),
                        IsDefault = c.Boolean(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_CustomerInfo_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_CustomerInfo_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Addresses", t => t.AddressId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.CreatorUserId)
                .ForeignKey("dbo.User", t => t.DeleterUserId)
                .ForeignKey("dbo.User", t => t.LastModifierUserId)
                .Index(t => t.AddressId)
                .Index(t => t.DeleterUserId)
                .Index(t => t.LastModifierUserId)
                .Index(t => t.CreatorUserId);
            
            CreateTable(
                "dbo.Feature",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 128),
                        Value = c.String(nullable: false, maxLength: 2000),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                        EditionId = c.Int(),
                        TenantId = c.Int(),
                        Discriminator = c.String(nullable: false, maxLength: 128),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_TenantFeatureSetting_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Edition", t => t.EditionId, cascadeDelete: true)
                .Index(t => t.EditionId);
            
            CreateTable(
                "dbo.Edition",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 32),
                        DisplayName = c.String(nullable: false, maxLength: 64),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Edition_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.GlobalRebates",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Ratio = c.Single(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_GlobalRebate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_GlobalRebate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.InfrastructureFileInfoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(),
                        Name = c.String(),
                        FileSize = c.Int(nullable: false),
                        FileType = c.String(maxLength: 50),
                        Path = c.String(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_InfrastructureFileInfo_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Language",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(),
                        Name = c.String(nullable: false, maxLength: 10),
                        DisplayName = c.String(nullable: false, maxLength: 64),
                        Icon = c.String(maxLength: 128),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ApplicationLanguage_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ApplicationLanguage_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.LanguageText",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        LanguageName = c.String(nullable: false, maxLength: 10),
                        Source = c.String(nullable: false, maxLength: 128),
                        Key = c.String(nullable: false, maxLength: 256),
                        Value = c.String(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ApplicationLanguageText_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.MemberCards",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        No = c.String(nullable: false, maxLength: 20),
                        UserId = c.Long(nullable: false),
                        Expiry = c.Long(),
                        LimitTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                        Level_Id = c.Int(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_MemberCard_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.MemberLevels", t => t.Level_Id, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.Level_Id);
            
            CreateTable(
                "dbo.Notification",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        NotificationName = c.String(nullable: false, maxLength: 96),
                        Data = c.String(),
                        DataTypeName = c.String(maxLength: 512),
                        EntityTypeName = c.String(maxLength: 250),
                        EntityTypeAssemblyQualifiedName = c.String(maxLength: 512),
                        EntityId = c.String(maxLength: 96),
                        Severity = c.Byte(nullable: false),
                        UserIds = c.String(),
                        ExcludedUserIds = c.String(),
                        TenantIds = c.String(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.NotificationSubscription",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        TenantId = c.Int(),
                        UserId = c.Long(nullable: false),
                        NotificationName = c.String(maxLength: 96),
                        EntityTypeName = c.String(maxLength: 250),
                        EntityTypeAssemblyQualifiedName = c.String(maxLength: 512),
                        EntityId = c.String(maxLength: 96),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_NotificationSubscriptionInfo_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .Index(t => new { t.NotificationName, t.EntityTypeName, t.EntityId, t.UserId });
            
            CreateTable(
                "dbo.OrderAreaAgentDistributions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        OrderMoney = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        UserId = c.Long(nullable: false),
                        DistributionId = c.Int(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AreaAgentDistributions", t => t.DistributionId, cascadeDelete: true)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .Index(t => t.OrderId)
                .Index(t => t.DistributionId);
            
            CreateTable(
                "dbo.OrderChannelAgentDistributions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        OrderMoney = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        UserId = c.Long(nullable: false),
                        DistributionId = c.Int(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ChannelAgentDistributions", t => t.DistributionId, cascadeDelete: true)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .Index(t => t.OrderId)
                .Index(t => t.DistributionId);
            
            CreateTable(
                "dbo.OrderChannelAgentProductDistributions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        OrderMoney = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        OrderItemId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        DistributionId = c.Int(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ChannelAgentProductDistributions", t => t.DistributionId, cascadeDelete: true)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .Index(t => t.OrderId)
                .Index(t => t.DistributionId);
            
            CreateTable(
                "dbo.OrderDistributions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        OrderMoney = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        OrderItemId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        DistributionId = c.Int(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Distributions", t => t.DistributionId, cascadeDelete: true)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .Index(t => t.OrderId)
                .Index(t => t.DistributionId);
            
            CreateTable(
                "dbo.OrderGlobalRebates",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        OrderId = c.Int(nullable: false),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_OrderGlobalRebate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.OrderItemVirtualCards",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        OrderItemId = c.Int(nullable: false),
                        VirtualCardId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.OrganizationUnit",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        ParentId = c.Long(),
                        Code = c.String(nullable: false, maxLength: 95),
                        DisplayName = c.String(nullable: false, maxLength: 128),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_OrganizationUnit_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_OrganizationUnit_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.OrganizationUnit", t => t.ParentId)
                .Index(t => t.ParentId);
            
            CreateTable(
                "dbo.PictureTemplates",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        Template = c.String(nullable: false),
                        TenantId = c.Int(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                        IsDefault = c.Boolean(),
                        Discriminator = c.String(nullable: false, maxLength: 128),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_PictureTemplate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_PictureTemplate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_SpreadPosterTemplate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_SpreadPosterTemplate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.TemplateParameters",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        DisplayName = c.String(nullable: false),
                        Type = c.Int(nullable: false),
                        Value = c.String(),
                        FontStyle_Size = c.Int(nullable: false),
                        FontStyle_Color = c.String(),
                        FontStyle_FontFamly = c.String(),
                        Coordinate_Width = c.Int(nullable: false),
                        Coordinate_Height = c.Int(nullable: false),
                        Coordinate_StartX = c.Int(nullable: false),
                        Coordinate_StartY = c.Int(nullable: false),
                        PictureTemplate_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.PictureTemplates", t => t.PictureTemplate_Id)
                .Index(t => t.PictureTemplate_Id);
            
            CreateTable(
                "dbo.Qrcodes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        SceneId = c.Int(nullable: false),
                        SceneStr = c.String(),
                        Ticket = c.String(),
                        Type = c.Int(nullable: false),
                        Url = c.String(),
                        ExpireSeconds = c.Int(nullable: false),
                        Path = c.String(),
                        Name = c.String(),
                        UserId = c.Long(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Qrcode_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Qrcode_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Role",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DisplayName = c.String(nullable: false, maxLength: 64),
                        IsStatic = c.Boolean(nullable: false),
                        IsDefault = c.Boolean(nullable: false),
                        TenantId = c.Int(),
                        Name = c.String(nullable: false, maxLength: 32),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Role_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Role_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.CreatorUserId)
                .ForeignKey("dbo.User", t => t.DeleterUserId)
                .ForeignKey("dbo.User", t => t.LastModifierUserId)
                .Index(t => t.DeleterUserId)
                .Index(t => t.LastModifierUserId)
                .Index(t => t.CreatorUserId);
            
            CreateTable(
                "dbo.ScoreRecords",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Score = c.Int(nullable: false),
                        Remark = c.String(),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ScoreRecord_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ScoreRecord_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Scores",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Total = c.Int(nullable: false),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Score_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.ShareAccesses",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ShareId = c.Int(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Shares", t => t.ShareId, cascadeDelete: true)
                .Index(t => t.ShareId);
            
            CreateTable(
                "dbo.Shares",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        No = c.String(nullable: false),
                        Title = c.String(nullable: false),
                        Link = c.String(nullable: false),
                        ImgUrl = c.String(),
                        Desc = c.String(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.CreatorUserId)
                .Index(t => t.CreatorUserId);
            
            CreateTable(
                "dbo.ShopCartItems",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ShopCartId = c.Int(nullable: false),
                        SpecificationId = c.Int(nullable: false),
                        Count = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Specifications", t => t.SpecificationId, cascadeDelete: true)
                .ForeignKey("dbo.ShopCarts", t => t.ShopCartId, cascadeDelete: true)
                .Index(t => t.ShopCartId)
                .Index(t => t.SpecificationId);
            
            CreateTable(
                "dbo.ShopCarts",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Long(nullable: false),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ShopTemplates",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        IsDefault = c.Boolean(nullable: false),
                        Name = c.String(),
                        Template = c.String(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ShopTemplate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ShopTemplate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.TenantNotification",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        TenantId = c.Int(),
                        NotificationName = c.String(nullable: false, maxLength: 96),
                        Data = c.String(),
                        DataTypeName = c.String(maxLength: 512),
                        EntityTypeName = c.String(maxLength: 250),
                        EntityTypeAssemblyQualifiedName = c.String(maxLength: 512),
                        EntityId = c.String(maxLength: 96),
                        Severity = c.Byte(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_TenantNotificationInfo_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Tenant",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        EditionId = c.Int(),
                        Name = c.String(nullable: false, maxLength: 128),
                        IsActive = c.Boolean(nullable: false),
                        TenancyName = c.String(nullable: false, maxLength: 64),
                        ConnectionString = c.String(maxLength: 1024),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Tenant_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.CreatorUserId)
                .ForeignKey("dbo.User", t => t.DeleterUserId)
                .ForeignKey("dbo.Edition", t => t.EditionId)
                .ForeignKey("dbo.User", t => t.LastModifierUserId)
                .Index(t => t.EditionId)
                .Index(t => t.DeleterUserId)
                .Index(t => t.LastModifierUserId)
                .Index(t => t.CreatorUserId);
            
            CreateTable(
                "dbo.UserAccount",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        UserId = c.Long(nullable: false),
                        UserLinkId = c.Long(),
                        UserName = c.String(),
                        EmailAddress = c.String(),
                        LastLoginTime = c.DateTime(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserAccount_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.UserLoginAttempt",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        TenancyName = c.String(maxLength: 64),
                        UserId = c.Long(),
                        UserNameOrEmailAddress = c.String(maxLength: 255),
                        ClientIpAddress = c.String(maxLength: 64),
                        ClientName = c.String(maxLength: 128),
                        BrowserInfo = c.String(maxLength: 256),
                        Result = c.Byte(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserLoginAttempt_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .Index(t => new { t.UserId, t.TenantId })
                .Index(t => new { t.TenancyName, t.UserNameOrEmailAddress, t.Result });
            
            CreateTable(
                "dbo.UserNotification",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        TenantId = c.Int(),
                        UserId = c.Long(nullable: false),
                        TenantNotificationId = c.Guid(nullable: false),
                        State = c.Int(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserNotificationInfo_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .Index(t => new { t.UserId, t.State, t.CreationTime });
            
            CreateTable(
                "dbo.UserOrganizationUnit",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        TenantId = c.Int(),
                        UserId = c.Long(nullable: false),
                        OrganizationUnitId = c.Long(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserOrganizationUnit_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.VirtualCards",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 32),
                        Value = c.String(nullable: false, maxLength: 32),
                        ExpireDays = c.Int(),
                        Remark = c.String(),
                        CardNumber = c.String(maxLength: 32),
                        CardPassword = c.String(maxLength: 64),
                        Status = c.Int(nullable: false),
                        Version = c.String(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_VirtualCard_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_VirtualCard_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.WalletRecords",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        SerialNumber = c.String(nullable: false),
                        Status = c.Int(nullable: false),
                        FreezeKey = c.String(),
                        FromUserId = c.Long(),
                        ToUserId = c.Long(),
                        UserId = c.Long(nullable: false),
                        Type = c.Int(nullable: false),
                        PayType = c.Int(),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Remark = c.String(),
                        PayStatus = c.Int(nullable: false),
                        PayDateTime = c.DateTime(),
                        FetchStatus = c.Int(nullable: false),
                        FreezingLimit = c.DateTime(),
                        FetchDateTime = c.DateTime(),
                        FailReason = c.String(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_WalletRecord_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_WalletRecord_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Wallets",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TenantId = c.Int(nullable: false),
                        UserId = c.Long(nullable: false),
                        PayPassword = c.String(),
                        Money = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Name = c.String(),
                        IsDeleted = c.Boolean(nullable: false),
                        DeleterUserId = c.Long(),
                        DeletionTime = c.DateTime(),
                        LastModificationTime = c.DateTime(),
                        LastModifierUserId = c.Long(),
                        CreationTime = c.DateTime(nullable: false),
                        CreatorUserId = c.Long(),
                    },
                annotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Wallet_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Wallet_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.SpecificationPropertyProducts",
                c => new
                    {
                        SpecificationProperty_Id = c.Int(nullable: false),
                        Product_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.SpecificationProperty_Id, t.Product_Id })
                .ForeignKey("dbo.SpecificationProperties", t => t.SpecificationProperty_Id, cascadeDelete: true)
                .ForeignKey("dbo.Products", t => t.Product_Id, cascadeDelete: true)
                .Index(t => t.SpecificationProperty_Id)
                .Index(t => t.Product_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.WalletRecords", "UserId", "dbo.User");
            DropForeignKey("dbo.Tenant", "LastModifierUserId", "dbo.User");
            DropForeignKey("dbo.Tenant", "EditionId", "dbo.Edition");
            DropForeignKey("dbo.Tenant", "DeleterUserId", "dbo.User");
            DropForeignKey("dbo.Tenant", "CreatorUserId", "dbo.User");
            DropForeignKey("dbo.ShopCartItems", "ShopCartId", "dbo.ShopCarts");
            DropForeignKey("dbo.ShopCartItems", "SpecificationId", "dbo.Specifications");
            DropForeignKey("dbo.ShareAccesses", "ShareId", "dbo.Shares");
            DropForeignKey("dbo.Shares", "CreatorUserId", "dbo.User");
            DropForeignKey("dbo.Scores", "UserId", "dbo.User");
            DropForeignKey("dbo.ScoreRecords", "UserId", "dbo.User");
            DropForeignKey("dbo.Permission", "RoleId", "dbo.Role");
            DropForeignKey("dbo.Role", "LastModifierUserId", "dbo.User");
            DropForeignKey("dbo.Role", "DeleterUserId", "dbo.User");
            DropForeignKey("dbo.Role", "CreatorUserId", "dbo.User");
            DropForeignKey("dbo.TemplateParameters", "PictureTemplate_Id", "dbo.PictureTemplates");
            DropForeignKey("dbo.OrganizationUnit", "ParentId", "dbo.OrganizationUnit");
            DropForeignKey("dbo.OrderDistributions", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.OrderDistributions", "DistributionId", "dbo.Distributions");
            DropForeignKey("dbo.OrderChannelAgentProductDistributions", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.OrderChannelAgentProductDistributions", "DistributionId", "dbo.ChannelAgentProductDistributions");
            DropForeignKey("dbo.OrderChannelAgentDistributions", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.OrderChannelAgentDistributions", "DistributionId", "dbo.ChannelAgentDistributions");
            DropForeignKey("dbo.OrderAreaAgentDistributions", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.OrderAreaAgentDistributions", "DistributionId", "dbo.AreaAgentDistributions");
            DropForeignKey("dbo.MemberCards", "UserId", "dbo.User");
            DropForeignKey("dbo.MemberCards", "Level_Id", "dbo.MemberLevels");
            DropForeignKey("dbo.GlobalRebates", "UserId", "dbo.User");
            DropForeignKey("dbo.Feature", "EditionId", "dbo.Edition");
            DropForeignKey("dbo.CustomerInfoes", "LastModifierUserId", "dbo.User");
            DropForeignKey("dbo.CustomerInfoes", "DeleterUserId", "dbo.User");
            DropForeignKey("dbo.CustomerInfoes", "CreatorUserId", "dbo.User");
            DropForeignKey("dbo.CustomerInfoes", "AddressId", "dbo.Addresses");
            DropForeignKey("dbo.ChannelAgentRebates", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.ChannelAgentRebates", "ChannelAgentId", "dbo.ChannelAgents");
            DropForeignKey("dbo.ChannelAgencyApplies", "UserId", "dbo.User");
            DropForeignKey("dbo.ChannelAgencyApplies", "ChannelAgentId", "dbo.ChannelAgents");
            DropForeignKey("dbo.ChannelAgencies", "UserId", "dbo.User");
            DropForeignKey("dbo.ChannelAgencies", "ChannelAgentId", "dbo.ChannelAgents");
            DropForeignKey("dbo.ChannelAgentDistributions", "ChannelAgentId", "dbo.ChannelAgents");
            DropForeignKey("dbo.ChannelAgentAssortments", "ChannelAgentId", "dbo.ChannelAgents");
            DropForeignKey("dbo.ChannelAgentAssortments", "SpecificationId", "dbo.Specifications");
            DropForeignKey("dbo.AutoReplyArticles", "AutoReplyId", "dbo.AutoReplies");
            DropForeignKey("dbo.ArticleHints", "ArticleId", "dbo.Articles");
            DropForeignKey("dbo.AreaAgentRebates", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.AreaAgentRebates", "AreaAgentId", "dbo.AreaAgents");
            DropForeignKey("dbo.AreaAgencies", "UserId", "dbo.User");
            DropForeignKey("dbo.AreaAgencies", "AreaAgentId", "dbo.AreaAgents");
            DropForeignKey("dbo.AreaAgencyAreas", "AreaAgencyId", "dbo.AreaAgencies");
            DropForeignKey("dbo.AreaAgencyAreas", "AddressId", "dbo.Addresses");
            DropForeignKey("dbo.AreaAgencyApplies", "UserId", "dbo.User");
            DropForeignKey("dbo.AreaAgencyApplies", "AreaAgentId", "dbo.AreaAgents");
            DropForeignKey("dbo.AreaAgentDistributions", "AreaAgentId", "dbo.AreaAgents");
            DropForeignKey("dbo.AreaAgencyApplyAddresses", "AreaAgencyApplyId", "dbo.AreaAgencyApplies");
            DropForeignKey("dbo.AreaAgencyApplyAddresses", "AddressId", "dbo.Addresses");
            DropForeignKey("dbo.OrderCustomerInfoes", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.OrderItems", "SpecificationId", "dbo.Specifications");
            DropForeignKey("dbo.SpecificationPropertyValues", "SpecificationId", "dbo.Specifications");
            DropForeignKey("dbo.SpecificationPropertyValues", "SpecificationPropertyId", "dbo.SpecificationProperties");
            DropForeignKey("dbo.Specifications", "ProductId", "dbo.Products");
            DropForeignKey("dbo.SpecificationPropertyProducts", "Product_Id", "dbo.Products");
            DropForeignKey("dbo.SpecificationPropertyProducts", "SpecificationProperty_Id", "dbo.SpecificationProperties");
            DropForeignKey("dbo.ProductProperties", "ProductId", "dbo.Products");
            DropForeignKey("dbo.Products", "ProductCategoryId", "dbo.ProductCategories");
            DropForeignKey("dbo.ProductCategories", "ParentId", "dbo.ProductCategories");
            DropForeignKey("dbo.Products", "FreightTemplateId", "dbo.FreightTemplates");
            DropForeignKey("dbo.DeliveryAreas", "FreightTemplateId", "dbo.FreightTemplates");
            DropForeignKey("dbo.Distributions", "ProductId", "dbo.Products");
            DropForeignKey("dbo.CustomCustomerInfoes", "ProductId", "dbo.Products");
            DropForeignKey("dbo.ProductComments", "ProductId", "dbo.Products");
            DropForeignKey("dbo.ChannelAgentProductDistributions", "ProductId", "dbo.Products");
            DropForeignKey("dbo.OrderItems", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.OrderItems", "Comment_Id", "dbo.ProductComments");
            DropForeignKey("dbo.ProductComments", "CreatorUserId", "dbo.User");
            DropForeignKey("dbo.Orders", "MemberCardPackage_Id", "dbo.MemberCardPackages");
            DropForeignKey("dbo.MemberCardPackages", "MemberLevelId", "dbo.MemberLevels");
            DropForeignKey("dbo.Orders", "UserId", "dbo.User");
            DropForeignKey("dbo.WechatUserInfoes", "User_Id", "dbo.User");
            DropForeignKey("dbo.UserDetails", "User_Id", "dbo.User");
            DropForeignKey("dbo.Setting", "UserId", "dbo.User");
            DropForeignKey("dbo.UserRole", "UserId", "dbo.User");
            DropForeignKey("dbo.Permission", "UserId", "dbo.User");
            DropForeignKey("dbo.UserLogin", "UserId", "dbo.User");
            DropForeignKey("dbo.User", "LastModifierUserId", "dbo.User");
            DropForeignKey("dbo.User", "DeleterUserId", "dbo.User");
            DropForeignKey("dbo.User", "CreatorUserId", "dbo.User");
            DropForeignKey("dbo.UserClaim", "UserId", "dbo.User");
            DropForeignKey("dbo.User", "ParentUserId", "dbo.User");
            DropForeignKey("dbo.OrderCustomCustomerInfoes", "Order_Id", "dbo.Orders");
            DropForeignKey("dbo.Orders", "ExpressCompanyId", "dbo.ExpressCompanies");
            DropForeignKey("dbo.OrderCustomerInfoes", "AddressId", "dbo.Addresses");
            DropForeignKey("dbo.OrderCustomCustomerInfoes", "CustomCustomerInfoId", "dbo.CustomCustomerInfoes");
            DropForeignKey("dbo.Addresses", "ParentId", "dbo.Addresses");
            DropIndex("dbo.SpecificationPropertyProducts", new[] { "Product_Id" });
            DropIndex("dbo.SpecificationPropertyProducts", new[] { "SpecificationProperty_Id" });
            DropIndex("dbo.WalletRecords", new[] { "UserId" });
            DropIndex("dbo.UserNotification", new[] { "UserId", "State", "CreationTime" });
            DropIndex("dbo.UserLoginAttempt", new[] { "TenancyName", "UserNameOrEmailAddress", "Result" });
            DropIndex("dbo.UserLoginAttempt", new[] { "UserId", "TenantId" });
            DropIndex("dbo.Tenant", new[] { "CreatorUserId" });
            DropIndex("dbo.Tenant", new[] { "LastModifierUserId" });
            DropIndex("dbo.Tenant", new[] { "DeleterUserId" });
            DropIndex("dbo.Tenant", new[] { "EditionId" });
            DropIndex("dbo.ShopCartItems", new[] { "SpecificationId" });
            DropIndex("dbo.ShopCartItems", new[] { "ShopCartId" });
            DropIndex("dbo.Shares", new[] { "CreatorUserId" });
            DropIndex("dbo.ShareAccesses", new[] { "ShareId" });
            DropIndex("dbo.Scores", new[] { "UserId" });
            DropIndex("dbo.ScoreRecords", new[] { "UserId" });
            DropIndex("dbo.Role", new[] { "CreatorUserId" });
            DropIndex("dbo.Role", new[] { "LastModifierUserId" });
            DropIndex("dbo.Role", new[] { "DeleterUserId" });
            DropIndex("dbo.TemplateParameters", new[] { "PictureTemplate_Id" });
            DropIndex("dbo.OrganizationUnit", new[] { "ParentId" });
            DropIndex("dbo.OrderDistributions", new[] { "DistributionId" });
            DropIndex("dbo.OrderDistributions", new[] { "OrderId" });
            DropIndex("dbo.OrderChannelAgentProductDistributions", new[] { "DistributionId" });
            DropIndex("dbo.OrderChannelAgentProductDistributions", new[] { "OrderId" });
            DropIndex("dbo.OrderChannelAgentDistributions", new[] { "DistributionId" });
            DropIndex("dbo.OrderChannelAgentDistributions", new[] { "OrderId" });
            DropIndex("dbo.OrderAreaAgentDistributions", new[] { "DistributionId" });
            DropIndex("dbo.OrderAreaAgentDistributions", new[] { "OrderId" });
            DropIndex("dbo.NotificationSubscription", new[] { "NotificationName", "EntityTypeName", "EntityId", "UserId" });
            DropIndex("dbo.MemberCards", new[] { "Level_Id" });
            DropIndex("dbo.MemberCards", new[] { "UserId" });
            DropIndex("dbo.GlobalRebates", new[] { "UserId" });
            DropIndex("dbo.Feature", new[] { "EditionId" });
            DropIndex("dbo.CustomerInfoes", new[] { "CreatorUserId" });
            DropIndex("dbo.CustomerInfoes", new[] { "LastModifierUserId" });
            DropIndex("dbo.CustomerInfoes", new[] { "DeleterUserId" });
            DropIndex("dbo.CustomerInfoes", new[] { "AddressId" });
            DropIndex("dbo.ChannelAgentRebates", new[] { "ChannelAgentId" });
            DropIndex("dbo.ChannelAgentRebates", new[] { "OrderId" });
            DropIndex("dbo.ChannelAgencyApplies", new[] { "UserId" });
            DropIndex("dbo.ChannelAgencyApplies", new[] { "ChannelAgentId" });
            DropIndex("dbo.ChannelAgentDistributions", new[] { "ChannelAgentId" });
            DropIndex("dbo.ChannelAgentAssortments", new[] { "SpecificationId" });
            DropIndex("dbo.ChannelAgentAssortments", new[] { "ChannelAgentId" });
            DropIndex("dbo.ChannelAgencies", new[] { "UserId" });
            DropIndex("dbo.ChannelAgencies", new[] { "ChannelAgentId" });
            DropIndex("dbo.BackgroundJob", new[] { "IsAbandoned", "NextTryTime" });
            DropIndex("dbo.AutoReplyArticles", new[] { "AutoReplyId" });
            DropIndex("dbo.ArticleHints", new[] { "ArticleId" });
            DropIndex("dbo.AreaAgentRebates", new[] { "OrderId" });
            DropIndex("dbo.AreaAgentRebates", new[] { "AreaAgentId" });
            DropIndex("dbo.AreaAgencies", new[] { "UserId" });
            DropIndex("dbo.AreaAgencies", new[] { "AreaAgentId" });
            DropIndex("dbo.AreaAgencyAreas", new[] { "AddressId" });
            DropIndex("dbo.AreaAgencyAreas", new[] { "AreaAgencyId" });
            DropIndex("dbo.AreaAgentDistributions", new[] { "AreaAgentId" });
            DropIndex("dbo.AreaAgencyApplies", new[] { "UserId" });
            DropIndex("dbo.AreaAgencyApplies", new[] { "AreaAgentId" });
            DropIndex("dbo.AreaAgencyApplyAddresses", new[] { "AreaAgencyApplyId" });
            DropIndex("dbo.AreaAgencyApplyAddresses", new[] { "AddressId" });
            DropIndex("dbo.SpecificationPropertyValues", new[] { "SpecificationPropertyId" });
            DropIndex("dbo.SpecificationPropertyValues", new[] { "SpecificationId" });
            DropIndex("dbo.ProductProperties", new[] { "ProductId" });
            DropIndex("dbo.ProductCategories", new[] { "ParentId" });
            DropIndex("dbo.DeliveryAreas", new[] { "FreightTemplateId" });
            DropIndex("dbo.Distributions", new[] { "ProductId" });
            DropIndex("dbo.ChannelAgentProductDistributions", new[] { "ProductId" });
            DropIndex("dbo.Products", new[] { "ProductCategoryId" });
            DropIndex("dbo.Products", new[] { "FreightTemplateId" });
            DropIndex("dbo.Specifications", new[] { "ProductId" });
            DropIndex("dbo.ProductComments", new[] { "CreatorUserId" });
            DropIndex("dbo.ProductComments", new[] { "ProductId" });
            DropIndex("dbo.OrderItems", new[] { "Comment_Id" });
            DropIndex("dbo.OrderItems", new[] { "SpecificationId" });
            DropIndex("dbo.OrderItems", new[] { "OrderId" });
            DropIndex("dbo.MemberCardPackages", new[] { "MemberLevelId" });
            DropIndex("dbo.WechatUserInfoes", new[] { "User_Id" });
            DropIndex("dbo.UserDetails", new[] { "User_Id" });
            DropIndex("dbo.Setting", new[] { "UserId" });
            DropIndex("dbo.UserRole", new[] { "UserId" });
            DropIndex("dbo.Permission", new[] { "RoleId" });
            DropIndex("dbo.Permission", new[] { "UserId" });
            DropIndex("dbo.UserLogin", new[] { "UserId" });
            DropIndex("dbo.UserClaim", new[] { "UserId" });
            DropIndex("dbo.User", new[] { "CreatorUserId" });
            DropIndex("dbo.User", new[] { "LastModifierUserId" });
            DropIndex("dbo.User", new[] { "DeleterUserId" });
            DropIndex("dbo.User", new[] { "ParentUserId" });
            DropIndex("dbo.OrderCustomerInfoes", new[] { "AddressId" });
            DropIndex("dbo.OrderCustomerInfoes", new[] { "OrderId" });
            DropIndex("dbo.CustomCustomerInfoes", new[] { "ProductId" });
            DropIndex("dbo.OrderCustomCustomerInfoes", new[] { "Order_Id" });
            DropIndex("dbo.OrderCustomCustomerInfoes", new[] { "CustomCustomerInfoId" });
            DropIndex("dbo.Orders", new[] { "MemberCardPackage_Id" });
            DropIndex("dbo.Orders", new[] { "ExpressCompanyId" });
            DropIndex("dbo.Orders", new[] { "UserId" });
            DropIndex("dbo.Orders", new[] { "OrderStatus" });
            DropIndex("dbo.Orders", new[] { "Number" });
            DropIndex("dbo.Addresses", new[] { "ParentId" });
            DropTable("dbo.SpecificationPropertyProducts");
            DropTable("dbo.Wallets",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Wallet_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Wallet_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.WalletRecords",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_WalletRecord_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_WalletRecord_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.VirtualCards",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_VirtualCard_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_VirtualCard_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.UserOrganizationUnit",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserOrganizationUnit_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.UserNotification",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserNotificationInfo_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.UserLoginAttempt",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserLoginAttempt_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.UserAccount",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserAccount_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Tenant",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Tenant_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.TenantNotification",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_TenantNotificationInfo_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ShopTemplates",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ShopTemplate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ShopTemplate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ShopCarts");
            DropTable("dbo.ShopCartItems");
            DropTable("dbo.Shares");
            DropTable("dbo.ShareAccesses");
            DropTable("dbo.Scores",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Score_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ScoreRecords",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ScoreRecord_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ScoreRecord_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Role",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Role_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Role_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Qrcodes",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Qrcode_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Qrcode_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.TemplateParameters");
            DropTable("dbo.PictureTemplates",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_PictureTemplate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_PictureTemplate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_SpreadPosterTemplate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_SpreadPosterTemplate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.OrganizationUnit",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_OrganizationUnit_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_OrganizationUnit_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.OrderItemVirtualCards");
            DropTable("dbo.OrderGlobalRebates",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_OrderGlobalRebate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.OrderDistributions");
            DropTable("dbo.OrderChannelAgentProductDistributions");
            DropTable("dbo.OrderChannelAgentDistributions");
            DropTable("dbo.OrderAreaAgentDistributions");
            DropTable("dbo.NotificationSubscription",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_NotificationSubscriptionInfo_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Notification");
            DropTable("dbo.MemberCards",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_MemberCard_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.LanguageText",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ApplicationLanguageText_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Language",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ApplicationLanguage_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ApplicationLanguage_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.InfrastructureFileInfoes",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_InfrastructureFileInfo_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.GlobalRebates",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_GlobalRebate_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_GlobalRebate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Edition",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Edition_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Feature",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_TenantFeatureSetting_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.CustomerInfoes",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_CustomerInfo_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_CustomerInfo_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ChannelAgentRebates",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ChannelAgentRebate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ChannelAgencyApplies",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ChannelAgencyApply_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgencyApply_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ChannelAgentDistributions");
            DropTable("dbo.ChannelAgentAssortments");
            DropTable("dbo.ChannelAgents",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ChannelAgent_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgent_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ChannelAgencies",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ChannelAgency_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgency_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.BackgroundJob");
            DropTable("dbo.AutoReplies",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AutoReply_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AutoReply_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.AutoReplyArticles");
            DropTable("dbo.AuditLog",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AuditLog_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Articles",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Article_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Article_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ArticleLikes",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ArticleLike_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ArticleHints",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ArticleHint_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.AreaAgentRebates");
            DropTable("dbo.AreaAgencies",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgency_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgency_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.AreaAgencyAreas",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgencyArea_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.AreaAgentDistributions");
            DropTable("dbo.AreaAgents",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgent_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgent_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.AreaAgencyApplies",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgencyApply_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgencyApply_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.AreaAgencyApplyAddresses",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AreaAgencyApplyAddress_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.SpecificationPropertyValues");
            DropTable("dbo.SpecificationProperties");
            DropTable("dbo.ProductProperties");
            DropTable("dbo.ProductCategories",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ProductCategory_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ProductCategory_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.DeliveryAreas");
            DropTable("dbo.FreightTemplates",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_FreightTemplate_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Distributions");
            DropTable("dbo.ChannelAgentProductDistributions");
            DropTable("dbo.Products",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Product_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Product_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Specifications",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Specification_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Specification_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.ProductComments",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ProductComment_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.OrderItems");
            DropTable("dbo.MemberLevels",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_MemberLevel_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.MemberCardPackages",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_MemberCardPackage_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_MemberCardPackage_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.WechatUserInfoes",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_WechatUserInfo_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.UserDetails",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserDetail_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Setting",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_Setting_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.UserRole",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserRole_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Permission",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_PermissionSetting_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_RolePermissionSetting_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_UserPermissionSetting_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.UserLogin",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserLogin_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.UserClaim",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_UserClaim_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.User",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_User_MayHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_User_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.OrderCustomerInfoes");
            DropTable("dbo.CustomCustomerInfoes");
            DropTable("dbo.OrderCustomCustomerInfoes");
            DropTable("dbo.ExpressCompanies",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_ExpressCompany_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Orders",
                removedAnnotations: new Dictionary<string, object>
                {
                    { "DynamicFilter_AgentOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AgentOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgencyApplyOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_AreaAgencyApplyOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgencyApplyOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ChannelAgencyApplyOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_MemberCardPackageOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_MemberCardPackageOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Order_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_Order_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ProductOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ProductOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ScoreExchangeOrder_MustHaveTenant", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                    { "DynamicFilter_ScoreExchangeOrder_SoftDelete", "EntityFramework.DynamicFilters.DynamicFilterDefinition" },
                });
            DropTable("dbo.Addresses");
        }
    }
}
