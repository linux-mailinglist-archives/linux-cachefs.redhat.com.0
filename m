Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E86BC46952F
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Dec 2021 12:42:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-yrVCtSxEO7idmH6WYkICxA-1; Mon, 06 Dec 2021 06:42:38 -0500
X-MC-Unique: yrVCtSxEO7idmH6WYkICxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 786EF1023F4D;
	Mon,  6 Dec 2021 11:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F8745D68;
	Mon,  6 Dec 2021 11:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE5AD1809CB8;
	Mon,  6 Dec 2021 11:42:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B6BgV34006854 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Dec 2021 06:42:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D83CB1410F35; Mon,  6 Dec 2021 11:42:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3FC2140EBFE
	for <linux-cachefs@redhat.com>; Mon,  6 Dec 2021 11:42:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82BF43C02B62
	for <linux-cachefs@redhat.com>; Mon,  6 Dec 2021 11:42:31 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-467-WmZuu3XTO76JgXjTqz594w-1; Mon, 06 Dec 2021 06:42:27 -0500
X-MC-Unique: WmZuu3XTO76JgXjTqz594w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
	TI=SMTPD_---0UzcMKwq_1638790938
Received: from 30.225.24.25(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UzcMKwq_1638790938) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 06 Dec 2021 19:42:19 +0800
Message-ID: <d4167c15-b3ce-73b2-1d66-97d651723305@linux.alibaba.com>
Date: Mon, 6 Dec 2021 19:42:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.0
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
References: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
	<163819612321.215744.9738308885948264476.stgit@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <163819612321.215744.9738308885948264476.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 24/64] netfs: Pass more information on
 how to deal with a hole in the cache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/29/21 10:28 PM, David Howells wrote:
> Pass more information to the cache on how to deal with a hole if it
> encounters one when trying to read from the cache.  Three options are
> provided:
> 
>  (1) NETFS_READ_HOLE_IGNORE.  Read the hole along with the data, assuming
>      it to be a punched-out extent by the backing filesystem.
> 
>  (2) NETFS_READ_HOLE_CLEAR.  If there's a hole, erase the requested region
>      of the cache and clear the read buffer.
> 
>  (3) NETFS_READ_HOLE_FAIL.  Fail the read if a hole is detected.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/netfs/read_helper.c |    8 ++++----
>  include/linux/netfs.h  |   11 ++++++++++-
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 7dc79fa8a1f3..08df413efdf3 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -170,7 +170,7 @@ static void netfs_cache_read_terminated(void *priv, ssize_t transferred_or_error
>   */
>  static void netfs_read_from_cache(struct netfs_read_request *rreq,
>  				  struct netfs_read_subrequest *subreq,
> -				  bool seek_data)
> +				  enum netfs_read_from_hole read_hole)
>  {
>  	struct netfs_cache_resources *cres = &rreq->cache_resources;
>  	struct iov_iter iter;
> @@ -180,7 +180,7 @@ static void netfs_read_from_cache(struct netfs_read_request *rreq,
>  			subreq->start + subreq->transferred,
>  			subreq->len   - subreq->transferred);
>  
> -	cres->ops->read(cres, subreq->start, &iter, seek_data,
> +	cres->ops->read(cres, subreq->start, &iter, read_hole,
>  			netfs_cache_read_terminated, subreq);
>  }
>  
> @@ -466,7 +466,7 @@ static void netfs_rreq_short_read(struct netfs_read_request *rreq,
>  	netfs_get_read_subrequest(subreq);
>  	atomic_inc(&rreq->nr_rd_ops);
>  	if (subreq->source == NETFS_READ_FROM_CACHE)
> -		netfs_read_from_cache(rreq, subreq, true);
> +		netfs_read_from_cache(rreq, subreq, NETFS_READ_HOLE_CLEAR);

Hi I'm not sure why NETFS_READ_HOLE_CLEAR style should be used in 'short
read' case.

Besides,

```
static void netfs_read_from_cache(struct netfs_read_request *rreq,
				  struct netfs_read_subrequest *subreq,
				  enum netfs_read_from_hole read_hole)
{
	struct netfs_cache_resources *cres = &rreq->cache_resources;
	struct iov_iter iter;

	netfs_stat(&netfs_n_rh_read);
	iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages,
			subreq->start + subreq->transferred,
			subreq->len   - subreq->transferred);

	cres->ops->read(cres, subreq->start, &iter, read_hole,
			netfs_cache_read_terminated, subreq);
}
```

I'm not sure why 'subreq->start' is not incremented with
'subreq->transferred' when calling cres->ops->read() in 'short read' case.


>  	else
>  		netfs_read_from_server(rreq, subreq);
>  }
> @@ -794,7 +794,7 @@ static bool netfs_rreq_submit_slice(struct netfs_read_request *rreq,
>  		netfs_read_from_server(rreq, subreq);
>  		break;
>  	case NETFS_READ_FROM_CACHE:
> -		netfs_read_from_cache(rreq, subreq, false);
> +		netfs_read_from_cache(rreq, subreq, NETFS_READ_HOLE_IGNORE);
>  		break;
>  	default:
>  		BUG();




> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 5a46fde65759..b46c39d98bbd 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -196,6 +196,15 @@ struct netfs_read_request_ops {
>  	void (*cleanup)(struct address_space *mapping, void *netfs_priv);
>  };
>  
> +/*
> + * How to handle reading from a hole.
> + */
> +enum netfs_read_from_hole {
> +	NETFS_READ_HOLE_IGNORE,
> +	NETFS_READ_HOLE_CLEAR,
> +	NETFS_READ_HOLE_FAIL,
> +};
> +
>  /*
>   * Table of operations for access to a cache.  This is obtained by
>   * rreq->ops->begin_cache_operation().
> @@ -208,7 +217,7 @@ struct netfs_cache_ops {
>  	int (*read)(struct netfs_cache_resources *cres,
>  		    loff_t start_pos,
>  		    struct iov_iter *iter,
> -		    bool seek_data,
> +		    enum netfs_read_from_hole read_hole,
>  		    netfs_io_terminated_t term_func,
>  		    void *term_func_priv);
>  
> 

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

