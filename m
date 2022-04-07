Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4867D4F9339
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Apr 2022 12:44:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-z3Ti8gFMPIaI3jgMpJpumQ-1; Fri, 08 Apr 2022 06:44:33 -0400
X-MC-Unique: z3Ti8gFMPIaI3jgMpJpumQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD2D3104456B;
	Fri,  8 Apr 2022 10:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0900C27DB8;
	Fri,  8 Apr 2022 10:44:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A18951940352;
	Fri,  8 Apr 2022 10:44:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2D7041947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 14:39:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0FD191454537; Thu,  7 Apr 2022 14:39:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C21B1402427
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:39:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E78E33C1411D
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:39:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-mUKSX0KbPOOgLD6bd1Jqfg-1; Thu, 07 Apr 2022 10:39:49 -0400
X-MC-Unique: mUKSX0KbPOOgLD6bd1Jqfg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DAD65B82776;
 Thu,  7 Apr 2022 14:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3D1C385A4;
 Thu,  7 Apr 2022 14:39:41 +0000 (UTC)
Date: Thu, 7 Apr 2022 22:39:36 +0800
From: Gao Xiang <xiang@kernel.org>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yk73qB7j1tz+tJhE@debian>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com,
 fannaihao@baidu.com
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <20220406075612.60298-21-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220406075612.60298-21-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Fri, 08 Apr 2022 10:44:29 +0000
Subject: Re: [Linux-cachefs] [PATCH v8 20/20] erofs: add 'fsid' mount option
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: tianzichen@kuaishou.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 06, 2022 at 03:56:12PM +0800, Jeffle Xu wrote:
> Introduce 'fsid' mount option to enable on-demand read sementics, in
> which case, erofs will be mounted from data blobs. Users could specify
> the name of primary data blob by this mount option.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/super.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index a5e4de60a0d8..292b4a70ce19 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -398,6 +398,7 @@ enum {
>  	Opt_dax,
>  	Opt_dax_enum,
>  	Opt_device,
> +	Opt_fsid,
>  	Opt_err
>  };
>  
> @@ -422,6 +423,7 @@ static const struct fs_parameter_spec erofs_fs_parameters[] = {
>  	fsparam_flag("dax",             Opt_dax),
>  	fsparam_enum("dax",		Opt_dax_enum, erofs_dax_param_enums),
>  	fsparam_string("device",	Opt_device),
> +	fsparam_string("fsid",		Opt_fsid),
>  	{}
>  };
>  
> @@ -517,6 +519,16 @@ static int erofs_fc_parse_param(struct fs_context *fc,
>  		}
>  		++ctx->devs->extra_devices;
>  		break;
> +	case Opt_fsid:
> +#ifdef CONFIG_EROFS_FS_ONDEMAND
> +		kfree(ctx->opt.fsid);
> +		ctx->opt.fsid = kstrdup(param->string, GFP_KERNEL);
> +		if (!ctx->opt.fsid)
> +			return -ENOMEM;
> +#else
> +		errorfc(fc, "fsid option not supported");
> +#endif
> +		break;
>  	default:
>  		return -ENOPARAM;
>  	}
> @@ -597,9 +609,14 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  	sb->s_maxbytes = MAX_LFS_FILESIZE;
>  	sb->s_op = &erofs_sops;
>  
> -	if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
> -		erofs_err(sb, "failed to set erofs blksize");
> -		return -EINVAL;
> +	if (erofs_is_fscache_mode(sb)) {
> +		sb->s_blocksize = EROFS_BLKSIZ;
> +		sb->s_blocksize_bits = LOG_BLOCK_SIZE;
> +	} else {
> +		if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
> +			erofs_err(sb, "failed to set erofs blksize");
> +			return -EINVAL;
> +		}
>  	}
>  
>  	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
> @@ -608,7 +625,7 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  	sb->s_fs_info = sbi;
>  	sbi->opt = ctx->opt;
> -	sbi->dax_dev = fs_dax_get_by_bdev(sb->s_bdev, &sbi->dax_part_off);
> +	ctx->opt.fsid = NULL;
>  	sbi->devs = ctx->devs;
>  	ctx->devs = NULL;
>  
> @@ -625,6 +642,8 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  		err = super_setup_bdi(sb);
>  		if (err)
>  			return err;
> +	} else {
> +		sbi->dax_dev = fs_dax_get_by_bdev(sb->s_bdev, &sbi->dax_part_off);

It should go with the previous patch? And even over long line here.

Thanks,
Gao Xiang

>  	}
>  
>  	err = erofs_read_superblock(sb);
> @@ -684,6 +703,11 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  static int erofs_fc_get_tree(struct fs_context *fc)
>  {
> +	struct erofs_fs_context *ctx = fc->fs_private;
> +
> +	if (IS_ENABLED(CONFIG_EROFS_FS_ONDEMAND) && ctx->opt.fsid)
> +		return get_tree_nodev(fc, erofs_fc_fill_super);
> +
>  	return get_tree_bdev(fc, erofs_fc_fill_super);
>  }
>  
> @@ -733,6 +757,7 @@ static void erofs_fc_free(struct fs_context *fc)
>  	struct erofs_fs_context *ctx = fc->fs_private;
>  
>  	erofs_free_dev_context(ctx->devs);
> +	kfree(ctx->opt.fsid);
>  	kfree(ctx);
>  }
>  
> @@ -773,7 +798,10 @@ static void erofs_kill_sb(struct super_block *sb)
>  
>  	WARN_ON(sb->s_magic != EROFS_SUPER_MAGIC);
>  
> -	kill_block_super(sb);
> +	if (erofs_is_fscache_mode(sb))
> +		generic_shutdown_super(sb);
> +	else
> +		kill_block_super(sb);
>  
>  	sbi = EROFS_SB(sb);
>  	if (!sbi)
> @@ -783,6 +811,7 @@ static void erofs_kill_sb(struct super_block *sb)
>  	fs_put_dax(sbi->dax_dev);
>  	erofs_fscache_unregister_cookie(&sbi->s_fscache);
>  	erofs_fscache_unregister_fs(sb);
> +	kfree(sbi->opt.fsid);
>  	kfree(sbi);
>  	sb->s_fs_info = NULL;
>  }
> @@ -884,7 +913,10 @@ static int erofs_statfs(struct dentry *dentry, struct kstatfs *buf)
>  {
>  	struct super_block *sb = dentry->d_sb;
>  	struct erofs_sb_info *sbi = EROFS_SB(sb);
> -	u64 id = huge_encode_dev(sb->s_bdev->bd_dev);
> +	u64 id = 0;
> +
> +	if (!erofs_is_fscache_mode(sb))
> +		id = huge_encode_dev(sb->s_bdev->bd_dev);
>  
>  	buf->f_type = sb->s_magic;
>  	buf->f_bsize = EROFS_BLKSIZ;
> @@ -929,6 +961,10 @@ static int erofs_show_options(struct seq_file *seq, struct dentry *root)
>  		seq_puts(seq, ",dax=always");
>  	if (test_opt(opt, DAX_NEVER))
>  		seq_puts(seq, ",dax=never");
> +#ifdef CONFIG_EROFS_FS_ONDEMAND
> +	if (opt->fsid)
> +		seq_printf(seq, ",fsid=%s", opt->fsid);
> +#endif
>  	return 0;
>  }
>  
> -- 
> 2.27.0
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

