Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B6F4BD882
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Feb 2022 10:28:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-X4uH_It6PB2u1Z37ke5GrA-1; Mon, 21 Feb 2022 04:28:23 -0500
X-MC-Unique: X4uH_It6PB2u1Z37ke5GrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1BA92F4B;
	Mon, 21 Feb 2022 09:28:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80E916E180;
	Mon, 21 Feb 2022 09:28:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 140814CA9B;
	Mon, 21 Feb 2022 09:28:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21H7nf3Z007053 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 02:49:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC48740FF410; Thu, 17 Feb 2022 07:49:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D821140FF40D
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 07:49:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB8C1C068D0
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 07:49:40 +0000 (UTC)
Received: from out199-13.us.a.mail.aliyun.com
	(out199-13.us.a.mail.aliyun.com [47.90.199.13]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-81-6wc-yaRXN-ODV3hQKqZKwg-1; Thu, 17 Feb 2022 02:49:38 -0500
X-MC-Unique: 6wc-yaRXN-ODV3hQKqZKwg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
	MF=bo.liu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V4gpSp6_1645083855
Received: from rsjd01523.et2sqa(mailfrom:bo.liu@linux.alibaba.com
	fp:SMTPD_---0V4gpSp6_1645083855) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 17 Feb 2022 15:44:20 +0800
Date: Thu, 17 Feb 2022 15:44:15 +0800
From: Liu Bo <bo.liu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20220217074414.GA85627@rsjd01523.et2sqa>
References: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
	<20220209060108.43051-2-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220209060108.43051-2-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 21 Feb 2022 04:28:13 -0500
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	gregkh@linuxfoundation.org, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v3 01/22] fscache: export
	fscache_end_operation()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: bo.liu@linux.alibaba.com
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 09, 2022 at 02:00:47PM +0800, Jeffle Xu wrote:
> Export fscache_end_operation() to avoid code duplication.
> 
> Besides, considering the paired fscache_begin_read_operation() is
> already exported, it shall make sense to also export
> fscache_end_operation().
>

Looks reasonable to me.

Reviewed-by: Liu Bo <bo.liu@linux.alibaba.com>

> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/fscache/internal.h   | 11 -----------
>  fs/nfs/fscache.c        |  8 --------
>  include/linux/fscache.h | 14 ++++++++++++++
>  3 files changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
> index f121c21590dc..ed1c9ed737f2 100644
> --- a/fs/fscache/internal.h
> +++ b/fs/fscache/internal.h
> @@ -70,17 +70,6 @@ static inline void fscache_see_cookie(struct fscache_cookie *cookie,
>  			     where);
>  }
>  
> -/*
> - * io.c
> - */
> -static inline void fscache_end_operation(struct netfs_cache_resources *cres)
> -{
> -	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
> -
> -	if (ops)
> -		ops->end_operation(cres);
> -}
> -
>  /*
>   * main.c
>   */
> diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> index cfe901650ab0..39654ca72d3d 100644
> --- a/fs/nfs/fscache.c
> +++ b/fs/nfs/fscache.c
> @@ -249,14 +249,6 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
>  	}
>  }
>  
> -static inline void fscache_end_operation(struct netfs_cache_resources *cres)
> -{
> -	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
> -
> -	if (ops)
> -		ops->end_operation(cres);
> -}
> -
>  /*
>   * Fallback page reading interface.
>   */
> diff --git a/include/linux/fscache.h b/include/linux/fscache.h
> index 296c5f1d9f35..d2430da8aa67 100644
> --- a/include/linux/fscache.h
> +++ b/include/linux/fscache.h
> @@ -456,6 +456,20 @@ int fscache_begin_read_operation(struct netfs_cache_resources *cres,
>  	return -ENOBUFS;
>  }
>  
> +/**
> + * fscache_end_operation - End the read operation for the netfs lib
> + * @cres: The cache resources for the read operation
> + *
> + * Clean up the resources at the end of the read request.
> + */
> +static inline void fscache_end_operation(struct netfs_cache_resources *cres)
> +{
> +	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
> +
> +	if (ops)
> +		ops->end_operation(cres);
> +}
> +
>  /**
>   * fscache_read - Start a read from the cache.
>   * @cres: The cache resources to use
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

