Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5534634E5B
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Nov 2022 04:29:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669174177;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YA103Y3BWIFTGBLaf3qKdnZ+sVozF/jE1Ty+iB0BpPQ=;
	b=E6WHDy2JTsPKQKyaGFWlYssZuiU3cJGD+CiId8EnfnT0fOgXr2ccJ553iU7fdMncTTx5Zf
	lR83AE2ghoFOetFVja0Rw6ATQTJCA1HTs7ZjulL4ieVmTG4R6T1XuqXQMgOCGqAY5qJ4xv
	unAZwXg7+SZLdjbD2w8FL4MuDWctqZs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-2mLDlRJqNNKc4aNIiW7GSA-1; Tue, 22 Nov 2022 22:29:34 -0500
X-MC-Unique: 2mLDlRJqNNKc4aNIiW7GSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B595229AA2FE;
	Wed, 23 Nov 2022 03:29:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A556040C6EC5;
	Wed, 23 Nov 2022 03:29:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8892194658D;
	Wed, 23 Nov 2022 03:29:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BAB111946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 03:29:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DFF140C6EC6; Wed, 23 Nov 2022 03:29:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C3040C6EC5
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 03:29:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64C5938041C1
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 03:29:29 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-478-lwKNZ0ZZOH-7FicGPxi5aQ-1; Tue, 22 Nov 2022 22:29:25 -0500
X-MC-Unique: lwKNZ0ZZOH-7FicGPxi5aQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VVUtD9I_1669174159
Received: from 30.221.128.211(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VVUtD9I_1669174159) by smtp.aliyun-inc.com;
 Wed, 23 Nov 2022 11:29:20 +0800
Message-ID: <f03ad01c-1b7a-8f77-86bb-aa41b2a77d37@linux.alibaba.com>
Date: Wed, 23 Nov 2022 11:29:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: xiang@kernel.org, chao@kernel.org, jlayton@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com, dhowells@redhat.com
References: <20221117053017.21074-1-jefflexu@linux.alibaba.com>
 <20221117053017.21074-2-jefflexu@linux.alibaba.com>
In-Reply-To: <20221117053017.21074-2-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v4 1/2] fscache,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

How do you think of this patch?  It's already -rc6 and we'd like to
enable erofs large folios for Linux 6.2.

If it's possible, could you review or ack this patch?  Many thanks.


Thanks,
Jingbo Xu


On 11/17/22 1:30 PM, Jingbo Xu wrote:
> Add prepare_ondemand_read() callback dedicated for the on-demand read
> scenario, so that callers from this scenario can be decoupled from
> netfs_io_subrequest.
> 
> The original cachefiles_prepare_read() is now refactored to a generic
> routine accepting a parameter list instead of netfs_io_subrequest.
> There's no logic change, except that some debug info retrieved from
> netfs_io_subrequest is removed from trace_cachefiles_prep_read().
> 
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/cachefiles/io.c                | 77 ++++++++++++++++++++-----------
>  include/linux/netfs.h             |  8 ++++
>  include/trace/events/cachefiles.h | 27 ++++++-----
>  3 files changed, 71 insertions(+), 41 deletions(-)
> 
> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
> index 000a28f46e59..13648348d9f9 100644
> --- a/fs/cachefiles/io.c
> +++ b/fs/cachefiles/io.c
> @@ -385,38 +385,35 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
>  				  term_func, term_func_priv);
>  }
>  
> -/*
> - * Prepare a read operation, shortening it to a cached/uncached
> - * boundary as appropriate.
> - */
> -static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
> -						      loff_t i_size)
> +static inline enum netfs_io_source
> +cachefiles_do_prepare_read(struct netfs_cache_resources *cres,
> +			   loff_t start, size_t *_len, loff_t i_size,
> +			   unsigned long *_flags)
>  {
>  	enum cachefiles_prepare_read_trace why;
> -	struct netfs_io_request *rreq = subreq->rreq;
> -	struct netfs_cache_resources *cres = &rreq->cache_resources;
> -	struct cachefiles_object *object;
> +	struct cachefiles_object *object = NULL;
>  	struct cachefiles_cache *cache;
>  	struct fscache_cookie *cookie = fscache_cres_cookie(cres);
>  	const struct cred *saved_cred;
>  	struct file *file = cachefiles_cres_file(cres);
>  	enum netfs_io_source ret = NETFS_DOWNLOAD_FROM_SERVER;
> +	size_t len = *_len;
>  	loff_t off, to;
>  	ino_t ino = file ? file_inode(file)->i_ino : 0;
>  	int rc;
>  
> -	_enter("%zx @%llx/%llx", subreq->len, subreq->start, i_size);
> +	_enter("%zx @%llx/%llx", len, start, i_size);
>  
> -	if (subreq->start >= i_size) {
> +	if (start >= i_size) {
>  		ret = NETFS_FILL_WITH_ZEROES;
>  		why = cachefiles_trace_read_after_eof;
>  		goto out_no_object;
>  	}
>  
>  	if (test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags)) {
> -		__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
> +		__set_bit(NETFS_SREQ_COPY_TO_CACHE, _flags);
>  		why = cachefiles_trace_read_no_data;
> -		if (!test_bit(NETFS_SREQ_ONDEMAND, &subreq->flags))
> +		if (!test_bit(NETFS_SREQ_ONDEMAND, _flags))
>  			goto out_no_object;
>  	}
>  
> @@ -437,7 +434,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
>  retry:
>  	off = cachefiles_inject_read_error();
>  	if (off == 0)
> -		off = vfs_llseek(file, subreq->start, SEEK_DATA);
> +		off = vfs_llseek(file, start, SEEK_DATA);
>  	if (off < 0 && off >= (loff_t)-MAX_ERRNO) {
>  		if (off == (loff_t)-ENXIO) {
>  			why = cachefiles_trace_read_seek_nxio;
> @@ -449,21 +446,22 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
>  		goto out;
>  	}
>  
> -	if (off >= subreq->start + subreq->len) {
> +	if (off >= start + len) {
>  		why = cachefiles_trace_read_found_hole;
>  		goto download_and_store;
>  	}
>  
> -	if (off > subreq->start) {
> +	if (off > start) {
>  		off = round_up(off, cache->bsize);
> -		subreq->len = off - subreq->start;
> +		len = off - start;
> +		*_len = len;
>  		why = cachefiles_trace_read_found_part;
>  		goto download_and_store;
>  	}
>  
>  	to = cachefiles_inject_read_error();
>  	if (to == 0)
> -		to = vfs_llseek(file, subreq->start, SEEK_HOLE);
> +		to = vfs_llseek(file, start, SEEK_HOLE);
>  	if (to < 0 && to >= (loff_t)-MAX_ERRNO) {
>  		trace_cachefiles_io_error(object, file_inode(file), to,
>  					  cachefiles_trace_seek_error);
> @@ -471,12 +469,13 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
>  		goto out;
>  	}
>  
> -	if (to < subreq->start + subreq->len) {
> -		if (subreq->start + subreq->len >= i_size)
> +	if (to < start + len) {
> +		if (start + len >= i_size)
>  			to = round_up(to, cache->bsize);
>  		else
>  			to = round_down(to, cache->bsize);
> -		subreq->len = to - subreq->start;
> +		len = to - start;
> +		*_len = len;
>  	}
>  
>  	why = cachefiles_trace_read_have_data;
> @@ -484,12 +483,11 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
>  	goto out;
>  
>  download_and_store:
> -	__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
> -	if (test_bit(NETFS_SREQ_ONDEMAND, &subreq->flags)) {
> -		rc = cachefiles_ondemand_read(object, subreq->start,
> -					      subreq->len);
> +	__set_bit(NETFS_SREQ_COPY_TO_CACHE, _flags);
> +	if (test_bit(NETFS_SREQ_ONDEMAND, _flags)) {
> +		rc = cachefiles_ondemand_read(object, start, len);
>  		if (!rc) {
> -			__clear_bit(NETFS_SREQ_ONDEMAND, &subreq->flags);
> +			__clear_bit(NETFS_SREQ_ONDEMAND, _flags);
>  			goto retry;
>  		}
>  		ret = NETFS_INVALID_READ;
> @@ -497,10 +495,34 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
>  out:
>  	cachefiles_end_secure(cache, saved_cred);
>  out_no_object:
> -	trace_cachefiles_prep_read(subreq, ret, why, ino);
> +	trace_cachefiles_prep_read(object, start, len, *_flags, ret, why, ino);
>  	return ret;
>  }
>  
> +/*
> + * Prepare a read operation, shortening it to a cached/uncached
> + * boundary as appropriate.
> + */
> +static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
> +						    loff_t i_size)
> +{
> +	return cachefiles_do_prepare_read(&subreq->rreq->cache_resources,
> +					  subreq->start, &subreq->len, i_size,
> +					  &subreq->flags);
> +}
> +
> +/*
> + * Prepare an on-demand read operation, shortening it to a cached/uncached
> + * boundary as appropriate.
> + */
> +static enum netfs_io_source
> +cachefiles_prepare_ondemand_read(struct netfs_cache_resources *cres,
> +				 loff_t start, size_t *_len, loff_t i_size,
> +				 unsigned long *_flags)
> +{
> +	return cachefiles_do_prepare_read(cres, start, _len, i_size, _flags);
> +}
> +
>  /*
>   * Prepare for a write to occur.
>   */
> @@ -621,6 +643,7 @@ static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
>  	.write			= cachefiles_write,
>  	.prepare_read		= cachefiles_prepare_read,
>  	.prepare_write		= cachefiles_prepare_write,
> +	.prepare_ondemand_read	= cachefiles_prepare_ondemand_read,
>  	.query_occupancy	= cachefiles_query_occupancy,
>  };
>  
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index f2402ddeafbf..95cc0397f0ee 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -267,6 +267,14 @@ struct netfs_cache_ops {
>  			     loff_t *_start, size_t *_len, loff_t i_size,
>  			     bool no_space_allocated_yet);
>  
> +	/* Prepare an on-demand read operation, shortening it to a cached/uncached
> +	 * boundary as appropriate.
> +	 */
> +	enum netfs_io_source (*prepare_ondemand_read)(struct netfs_cache_resources *cres,
> +						      loff_t start, size_t *_len,
> +						      loff_t i_size,
> +						      unsigned long *_flags);
> +
>  	/* Query the occupancy of the cache in a region, returning where the
>  	 * next chunk of data starts and how long it is.
>  	 */
> diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
> index d8d4d73fe7b6..171c0d7f0bb7 100644
> --- a/include/trace/events/cachefiles.h
> +++ b/include/trace/events/cachefiles.h
> @@ -428,44 +428,43 @@ TRACE_EVENT(cachefiles_vol_coherency,
>  	    );
>  
>  TRACE_EVENT(cachefiles_prep_read,
> -	    TP_PROTO(struct netfs_io_subrequest *sreq,
> +	    TP_PROTO(struct cachefiles_object *obj,
> +		     loff_t start,
> +		     size_t len,
> +		     unsigned short flags,
>  		     enum netfs_io_source source,
>  		     enum cachefiles_prepare_read_trace why,
>  		     ino_t cache_inode),
>  
> -	    TP_ARGS(sreq, source, why, cache_inode),
> +	    TP_ARGS(obj, start, len, flags, source, why, cache_inode),
>  
>  	    TP_STRUCT__entry(
> -		    __field(unsigned int,		rreq		)
> -		    __field(unsigned short,		index		)
> +		    __field(unsigned int,		obj		)
>  		    __field(unsigned short,		flags		)
>  		    __field(enum netfs_io_source,	source		)
>  		    __field(enum cachefiles_prepare_read_trace,	why	)
>  		    __field(size_t,			len		)
>  		    __field(loff_t,			start		)
> -		    __field(unsigned int,		netfs_inode	)
>  		    __field(unsigned int,		cache_inode	)
>  			     ),
>  
>  	    TP_fast_assign(
> -		    __entry->rreq	= sreq->rreq->debug_id;
> -		    __entry->index	= sreq->debug_index;
> -		    __entry->flags	= sreq->flags;
> +		    __entry->obj	= obj ? obj->debug_id : 0;
> +		    __entry->flags	= flags;
>  		    __entry->source	= source;
>  		    __entry->why	= why;
> -		    __entry->len	= sreq->len;
> -		    __entry->start	= sreq->start;
> -		    __entry->netfs_inode = sreq->rreq->inode->i_ino;
> +		    __entry->len	= len;
> +		    __entry->start	= start;
>  		    __entry->cache_inode = cache_inode;
>  			   ),
>  
> -	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx ni=%x B=%x",
> -		      __entry->rreq, __entry->index,
> +	    TP_printk("o=%08x %s %s f=%02x s=%llx %zx B=%x",
> +		      __entry->obj,
>  		      __print_symbolic(__entry->source, netfs_sreq_sources),
>  		      __print_symbolic(__entry->why, cachefiles_prepare_read_traces),
>  		      __entry->flags,
>  		      __entry->start, __entry->len,
> -		      __entry->netfs_inode, __entry->cache_inode)
> +		      __entry->cache_inode)
>  	    );
>  
>  TRACE_EVENT(cachefiles_read,

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

