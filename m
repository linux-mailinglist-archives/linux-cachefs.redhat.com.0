Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E3B619556
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Nov 2022 12:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667561292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HWBD6aZxjG70SfKsP6XITij6+7yzlIimn2n/MMJCE/0=;
	b=hl+7Bn05+7ZJ1sbhU6k9WmtAZeSARVZ1n0oHbhTN/bpoALc+HsQs+/t/7JVzgLJKHe7HSM
	XbPViKhrTCu1nLZ+krisyUb5hiseT7BYK7zm1coagUu83LTFqqkThfMtD3BuEEfcC0l1F7
	nbjHFbD9H91JQSr77kWtcVKksIiPOB0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-juJ4jEfCMp-psQh8rBygJg-1; Fri, 04 Nov 2022 07:28:09 -0400
X-MC-Unique: juJ4jEfCMp-psQh8rBygJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E1B2185A78F;
	Fri,  4 Nov 2022 11:28:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 991DC112132C;
	Fri,  4 Nov 2022 11:28:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6019A1946594;
	Fri,  4 Nov 2022 11:28:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 446CD1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 11:28:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33005112132C; Fri,  4 Nov 2022 11:28:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C2831121325
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 11:28:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B67D1C08981
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 11:28:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-XmBrpgl3MIS81cj0ykBFZw-1; Fri, 04 Nov 2022 07:28:02 -0400
X-MC-Unique: XmBrpgl3MIS81cj0ykBFZw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3EBCC62162;
 Fri,  4 Nov 2022 11:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73B9C433C1;
 Fri,  4 Nov 2022 11:18:08 +0000 (UTC)
Message-ID: <c0d893bf6f52702a0bd2056a8cb005861b8324ea.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jingbo Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com, 
 xiang@kernel.org, chao@kernel.org, linux-cachefs@redhat.com, 
 linux-erofs@lists.ozlabs.org
Date: Fri, 04 Nov 2022 07:18:07 -0400
In-Reply-To: <20221104072637.72375-2-jefflexu@linux.alibaba.com>
References: <20221104072637.72375-1-jefflexu@linux.alibaba.com>
 <20221104072637.72375-2-jefflexu@linux.alibaba.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH 1/2] fscache,
 cachefiles: add prepare_ondemand_read() callback
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2022-11-04 at 15:26 +0800, Jingbo Xu wrote:
> Add prepare_ondemand_read() callback dedicated for the on-demand read
> scenario, so that callers from this scenario can be decoupled from
> netfs_io_subrequest.
> 
> To reuse the hole detecting logic as mush as possible, both the
> implementation of prepare_read() and prepare_ondemand_read() inside
> Cachefiles call a common routine.
> 
> In the near future, prepare_read() will get enhanced and more
> information will be needed and then returned to callers. Thus
> netfs_io_subrequest is a reasonable candidate for holding places for all
> these information needed in the internal implementation.
> 
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/cachefiles/io.c                | 42 +++++++++++++++++++++++++------
>  include/linux/netfs.h             |  7 ++++++
>  include/trace/events/cachefiles.h |  4 +--
>  3 files changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
> index 000a28f46e59..6427259fcba9 100644
> --- a/fs/cachefiles/io.c
> +++ b/fs/cachefiles/io.c
> @@ -385,16 +385,11 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
>  				  term_func, term_func_priv);
>  }
>  
> -/*
> - * Prepare a read operation, shortening it to a cached/uncached
> - * boundary as appropriate.
> - */
> -static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
> -						      loff_t i_size)
> +static enum netfs_io_source cachefiles_do_prepare_read(struct netfs_io_subrequest *subreq,
> +						       struct netfs_cache_resources *cres,
> +						       loff_t i_size)
>  {
>  	enum cachefiles_prepare_read_trace why;
> -	struct netfs_io_request *rreq = subreq->rreq;
> -	struct netfs_cache_resources *cres = &rreq->cache_resources;
>  	struct cachefiles_object *object;
>  	struct cachefiles_cache *cache;
>  	struct fscache_cookie *cookie = fscache_cres_cookie(cres);
> @@ -501,6 +496,36 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
>  	return ret;
>  }
>  
> +/*
> + * Prepare a read operation, shortening it to a cached/uncached
> + * boundary as appropriate.
> + */
> +static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
> +						      loff_t i_size)
> +{
> +	return cachefiles_do_prepare_read(subreq,
> +			&subreq->rreq->cache_resources, i_size);
> +}
> +
> +/*
> + * Prepare an on-demand read operation, shortening it to a cached/uncached
> + * boundary as appropriate.
> + */
> +static enum netfs_io_source cachefiles_prepare_ondemand_read(struct netfs_cache_resources *cres,
> +		loff_t start, size_t *_len, loff_t i_size)
> +{
> +	enum netfs_io_source source;
> +	struct netfs_io_subrequest subreq = {
> +		.start	= start,
> +		.len	= *_len,
> +		.flags	= 1 << NETFS_SREQ_ONDEMAND,
> +	};
> +

Faking up a struct like this is sort of fragile. What if we change
cachefiles_do_prepare_read to consult other fields in this structure
later?

It might be best to have cachefiles_do_prepare_read take individual
start, len, and flags values instead of doing this.


> +	source = cachefiles_do_prepare_read(&subreq, cres, i_size);
> +	*_len = subreq.len;
> +	return source;
> +}
> +
>  /*
>   * Prepare for a write to occur.
>   */
> @@ -621,6 +646,7 @@ static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
>  	.write			= cachefiles_write,
>  	.prepare_read		= cachefiles_prepare_read,
>  	.prepare_write		= cachefiles_prepare_write,
> +	.prepare_ondemand_read	= cachefiles_prepare_ondemand_read,
>  	.query_occupancy	= cachefiles_query_occupancy,
>  };
>  
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index f2402ddeafbf..d82071c37133 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -267,6 +267,13 @@ struct netfs_cache_ops {
>  			     loff_t *_start, size_t *_len, loff_t i_size,
>  			     bool no_space_allocated_yet);
>  
> +	/* Prepare an on-demand read operation, shortening it to a cached/uncached
> +	 * boundary as appropriate.
> +	 */
> +	enum netfs_io_source (*prepare_ondemand_read)(struct netfs_cache_resources *cres,
> +						      loff_t start, size_t *_len,
> +						      loff_t i_size);
> +
>  	/* Query the occupancy of the cache in a region, returning where the
>  	 * next chunk of data starts and how long it is.
>  	 */
> diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
> index d8d4d73fe7b6..655d5900b8ef 100644
> --- a/include/trace/events/cachefiles.h
> +++ b/include/trace/events/cachefiles.h
> @@ -448,14 +448,14 @@ TRACE_EVENT(cachefiles_prep_read,
>  			     ),
>  
>  	    TP_fast_assign(
> -		    __entry->rreq	= sreq->rreq->debug_id;
> +		    __entry->rreq	= sreq->rreq ? sreq->rreq->debug_id : 0;
>  		    __entry->index	= sreq->debug_index;
>  		    __entry->flags	= sreq->flags;
>  		    __entry->source	= source;
>  		    __entry->why	= why;
>  		    __entry->len	= sreq->len;
>  		    __entry->start	= sreq->start;
> -		    __entry->netfs_inode = sreq->rreq->inode->i_ino;
> +		    __entry->netfs_inode = sreq->rreq ? sreq->rreq->inode->i_ino : 0;
>  		    __entry->cache_inode = cache_inode;
>  			   ),
>  

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

