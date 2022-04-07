Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE854F933A
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Apr 2022 12:44:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-yhpCIlIcOLOUhuO5eGBZDw-1; Fri, 08 Apr 2022 06:44:33 -0400
X-MC-Unique: yhpCIlIcOLOUhuO5eGBZDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 734A780CC43;
	Fri,  8 Apr 2022 10:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAE0D54ACAD;
	Fri,  8 Apr 2022 10:44:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A2561940345;
	Fri,  8 Apr 2022 10:44:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1D3EA1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 14:10:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D94044066C9A; Thu,  7 Apr 2022 14:10:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4BEF407C943
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:10:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCAAC3811F23
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 14:10:05 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-1p7qpwxFPD2a-8WWeYi41g-1; Thu, 07 Apr 2022 10:10:02 -0400
X-MC-Unique: 1p7qpwxFPD2a-8WWeYi41g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29220B82735;
 Thu,  7 Apr 2022 14:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735B0C385A5;
 Thu,  7 Apr 2022 14:09:55 +0000 (UTC)
Date: Thu, 7 Apr 2022 22:09:50 +0800
From: Gao Xiang <xiang@kernel.org>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yk7wrmKYHbhJM8CY@debian>
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
 <20220406075612.60298-15-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220406075612.60298-15-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Fri, 08 Apr 2022 10:44:29 +0000
Subject: Re: [Linux-cachefs] [PATCH v8 14/20] erofs: register fscache
 context for primary data blob
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 06, 2022 at 03:56:06PM +0800, Jeffle Xu wrote:
> Registers fscache context for primary data blob. Also move the
> initialization of s_op and related fields forward, since anonymous
> inode will be allocated under the super block when registering the
> fscache context.
> 
> Something worth mentioning about the cleanup routine.
> 
> 1. The fscache context will instantiate anonymous inodes under the super
> block. Release these anonymous inodes when .put_super() is called, or
> we'll get "VFS: Busy inodes after unmount." warning.
> 
> 2. The fscache context is initialized prior to the root inode. If
> .kill_sb() is called when mount failed, .put_super() won't be called
> when root inode has not been initialized yet. Thus .kill_sb() shall
> also contain the cleanup routine.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/internal.h |  1 +
>  fs/erofs/super.c    | 15 +++++++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 3a4a344cfed3..eb37b33bce37 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -155,6 +155,7 @@ struct erofs_sb_info {
>  
>  	/* fscache support */
>  	struct fscache_volume *volume;
> +	struct erofs_fscache *s_fscache;
>  };
>  
>  #define EROFS_SB(sb) ((struct erofs_sb_info *)(sb)->s_fs_info)
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 6590ed1b7d3b..9498b899b73b 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -585,6 +585,9 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  	int err;
>  
>  	sb->s_magic = EROFS_SUPER_MAGIC;
> +	sb->s_flags |= SB_RDONLY | SB_NOATIME;
> +	sb->s_maxbytes = MAX_LFS_FILESIZE;
> +	sb->s_op = &erofs_sops;
>  
>  	if (!sb_set_blocksize(sb, EROFS_BLKSIZ)) {
>  		erofs_err(sb, "failed to set erofs blksize");
> @@ -605,6 +608,11 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  		err = erofs_fscache_register_fs(sb);
>  		if (err)
>  			return err;
> +
> +		err = erofs_fscache_register_cookie(sb, &sbi->s_fscache,
> +						    sbi->opt.fsid, true);
> +		if (err)
> +			return err;
>  	}
>  
>  	err = erofs_read_superblock(sb);
> @@ -619,11 +627,8 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>  			clear_opt(&sbi->opt, DAX_ALWAYS);
>  		}
>  	}
> -	sb->s_flags |= SB_RDONLY | SB_NOATIME;
> -	sb->s_maxbytes = MAX_LFS_FILESIZE;
> -	sb->s_time_gran = 1;
>  
> -	sb->s_op = &erofs_sops;
> +	sb->s_time_gran = 1;
>  	sb->s_xattr = erofs_xattr_handlers;
>  
>  	if (test_opt(&sbi->opt, POSIX_ACL))
> @@ -763,6 +768,7 @@ static void erofs_kill_sb(struct super_block *sb)
>  
>  	erofs_free_dev_context(sbi->devs);
>  	fs_put_dax(sbi->dax_dev);
> +	erofs_fscache_unregister_cookie(&sbi->s_fscache);
>  	erofs_fscache_unregister_fs(sb);
>  	kfree(sbi);
>  	sb->s_fs_info = NULL;
> @@ -781,6 +787,7 @@ static void erofs_put_super(struct super_block *sb)
>  	iput(sbi->managed_cache);
>  	sbi->managed_cache = NULL;
>  #endif
> +	erofs_fscache_unregister_cookie(&sbi->s_fscache);
>  }
>  
>  static struct file_system_type erofs_fs_type = {
> -- 
> 2.27.0
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

