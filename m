Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 145D37CE0EF
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 Oct 2023 17:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697642227;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uvTCVZwGb+53DNZmX43QtU7ub0uCU3AK7rJQ8xuj/ko=;
	b=YtAQsQJztd0k168lcmGEGWri4rVzaTgC5En2t+drUOgBdZ06yYt/rauvXVxa2mg0LpP8Xv
	4vvcheSoNTxGEpqGU/Zqca6S0U50Rt1jIe6oKRn/QJ9UzjyLV7GlcZvUit6oFl+sH09FA3
	J72WeOsJac6X631flxZTmrjJv2ql1Cw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-n7Yp6i_rMD-iZmWea92GwA-1; Wed, 18 Oct 2023 11:17:04 -0400
X-MC-Unique: n7Yp6i_rMD-iZmWea92GwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 315521C2B66C;
	Wed, 18 Oct 2023 15:17:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8ED94C15BBC;
	Wed, 18 Oct 2023 15:16:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9A8019466F6;
	Wed, 18 Oct 2023 15:16:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D4D319465B3 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 18 Oct 2023 15:03:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6BB18492BFB; Wed, 18 Oct 2023 15:03:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A35492BFA
 for <linux-cachefs@redhat.com>; Wed, 18 Oct 2023 15:03:21 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FCC82825EA1
 for <linux-cachefs@redhat.com>; Wed, 18 Oct 2023 15:03:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-530-RthS2MadPdq2fswsSNu87w-1; Wed,
 18 Oct 2023 11:03:17 -0400
X-MC-Unique: RthS2MadPdq2fswsSNu87w-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 51C8ECE24F4;
 Wed, 18 Oct 2023 15:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3E9C433C8;
 Wed, 18 Oct 2023 15:03:11 +0000 (UTC)
Message-ID: <9d2fc137b4295058ac3f88f1cca7a54bc67f01fd.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>
Date: Wed, 18 Oct 2023 11:03:10 -0400
In-Reply-To: <20231013160423.2218093-13-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
 <20231013160423.2218093-13-dhowells@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [RFC PATCH 12/53] netfs: Provide tools to
 create a buffer in an xarray
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, v9fs@lists.linux.dev,
 netdev@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org, Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-10-13 at 17:03 +0100, David Howells wrote:
> Provide tools to create a buffer in an xarray, with a function to add
> new folios with a mark.  This will be used to create bounce buffer and can be
> used more easily to create a list of folios the span of which would require
> more than a page's worth of bio_vec structs.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>  fs/netfs/internal.h   |  16 +++++
>  fs/netfs/misc.c       | 140 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/netfs.h |   4 ++
>  3 files changed, 160 insertions(+)
> 
> diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
> index 1f067aa96c50..00e01278316f 100644
> --- a/fs/netfs/internal.h
> +++ b/fs/netfs/internal.h
> @@ -52,6 +52,22 @@ static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq) {}
>  static inline void netfs_proc_del_rreq(struct netfs_io_request *rreq) {}
>  #endif
>  
> +/*
> + * misc.c
> + */
> +int netfs_xa_store_and_mark(struct xarray *xa, unsigned long index,
> +			    struct folio *folio, bool put_mark,
> +			    bool pagecache_mark, gfp_t gfp_mask);
> +int netfs_add_folios_to_buffer(struct xarray *buffer,
> +			       struct address_space *mapping,
> +			       pgoff_t index, pgoff_t to, gfp_t gfp_mask);
> +int netfs_set_up_buffer(struct xarray *buffer,
> +			struct address_space *mapping,
> +			struct readahead_control *ractl,
> +			struct folio *keep,
> +			pgoff_t have_index, unsigned int have_folios);
> +void netfs_clear_buffer(struct xarray *buffer);
> +
>  /*
>   * objects.c
>   */
> diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
> index c3baf2b247d9..c70f856f3129 100644
> --- a/fs/netfs/misc.c
> +++ b/fs/netfs/misc.c
> @@ -8,6 +8,146 @@
>  #include <linux/swap.h>
>  #include "internal.h"
>  
> +/*
> + * Attach a folio to the buffer and maybe set marks on it to say that we need
> + * to put the folio later and twiddle the pagecache flags.
> + */
> +int netfs_xa_store_and_mark(struct xarray *xa, unsigned long index,
> +			    struct folio *folio, bool put_mark,
> +			    bool pagecache_mark, gfp_t gfp_mask)
> +{
> +	XA_STATE_ORDER(xas, xa, index, folio_order(folio));
> +
> +retry:
> +	xas_lock(&xas);
> +	for (;;) {
> +		xas_store(&xas, folio);
> +		if (!xas_error(&xas))
> +			break;
> +		xas_unlock(&xas);
> +		if (!xas_nomem(&xas, gfp_mask))
> +			return xas_error(&xas);
> +		goto retry;
> +	}
> +
> +	if (put_mark)
> +		xas_set_mark(&xas, NETFS_BUF_PUT_MARK);
> +	if (pagecache_mark)
> +		xas_set_mark(&xas, NETFS_BUF_PAGECACHE_MARK);
> +	xas_unlock(&xas);
> +	return xas_error(&xas);
> +}
> +
> +/*
> + * Create the specified range of folios in the buffer attached to the read
> + * request.  The folios are marked with NETFS_BUF_PUT_MARK so that we know that
> + * these need freeing later.
> + */

Some kerneldoc comments on these new helpers would be nice. I assume
that "index" and "to" are "start" and "end" for this, but it'd be nice
to make that explicit.


> +int netfs_add_folios_to_buffer(struct xarray *buffer,
> +			       struct address_space *mapping,
> +			       pgoff_t index, pgoff_t to, gfp_t gfp_mask)
> +{
> +	struct folio *folio;
> +	int ret;
> +
> +	if (to + 1 == index) /* Page range is inclusive */
> +		return 0;
> +
> +	do {
> +		/* TODO: Figure out what order folio can be allocated here */
> +		folio = filemap_alloc_folio(readahead_gfp_mask(mapping), 0);
> +		if (!folio)
> +			return -ENOMEM;
> +		folio->index = index;
> +		ret = netfs_xa_store_and_mark(buffer, index, folio,
> +					      true, false, gfp_mask);
> +		if (ret < 0) {
> +			folio_put(folio);
> +			return ret;
> +		}
> +
> +		index += folio_nr_pages(folio);
> +	} while (index <= to && index != 0);
> +
> +	return 0;
> +}
> +
> +/*
> + * Set up a buffer into which to data will be read or decrypted/decompressed.
> + * The folios to be read into are attached to this buffer and the gaps filled
> + * in to form a continuous region.
> + */
> +int netfs_set_up_buffer(struct xarray *buffer,
> +			struct address_space *mapping,
> +			struct readahead_control *ractl,
> +			struct folio *keep,
> +			pgoff_t have_index, unsigned int have_folios)
> +{
> +	struct folio *folio;
> +	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> +	unsigned int want_folios = have_folios;
> +	pgoff_t want_index = have_index;
> +	int ret;
> +
> +	ret = netfs_add_folios_to_buffer(buffer, mapping, want_index,
> +					 have_index - 1, gfp_mask);
> +	if (ret < 0)
> +		return ret;
> +	have_folios += have_index - want_index;
> +
> +	ret = netfs_add_folios_to_buffer(buffer, mapping,
> +					 have_index + have_folios,
> +					 want_index + want_folios - 1,
> +					 gfp_mask);

I don't get it. Why are you calling netfs_add_folios_to_buffer twice
here? Why not just make one call? Either way, a comment here explaining
that would also be nice.

> +	if (ret < 0)
> +		return ret;
> +
> +	/* Transfer the folios proposed by the VM into the buffer and take refs
> +	 * on them.  The locks will be dropped in netfs_rreq_unlock().
> +	 */
> +	if (ractl) {
> +		while ((folio = readahead_folio(ractl))) {
> +			folio_get(folio);
> +			if (folio == keep)
> +				folio_get(folio);
> +			ret = netfs_xa_store_and_mark(buffer, folio->index, folio,
> +						      true, true, gfp_mask);
> +			if (ret < 0) {
> +				if (folio != keep)
> +					folio_unlock(folio);
> +				folio_put(folio);
> +				return ret;
> +			}
> +		}
> +	} else {
> +		folio_get(keep);
> +		ret = netfs_xa_store_and_mark(buffer, keep->index, keep,
> +					      true, true, gfp_mask);
> +		if (ret < 0) {
> +			folio_put(keep);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +
> +/*
> + * Clear an xarray buffer, putting a ref on the folios that have
> + * NETFS_BUF_PUT_MARK set.
> + */
> +void netfs_clear_buffer(struct xarray *buffer)
> +{
> +	struct folio *folio;
> +	XA_STATE(xas, buffer, 0);
> +
> +	rcu_read_lock();
> +	xas_for_each_marked(&xas, folio, ULONG_MAX, NETFS_BUF_PUT_MARK) {
> +		folio_put(folio);
> +	}
> +	rcu_read_unlock();
> +	xa_destroy(buffer);
> +}
> +
>  /**
>   * netfs_invalidate_folio - Invalidate or partially invalidate a folio
>   * @folio: Folio proposed for release
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 66479a61ad00..e8d702ac6968 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -109,6 +109,10 @@ static inline int wait_on_page_fscache_killable(struct page *page)
>  	return folio_wait_private_2_killable(page_folio(page));
>  }
>  
> +/* Marks used on xarray-based buffers */
> +#define NETFS_BUF_PUT_MARK	XA_MARK_0	/* - Page needs putting  */
> +#define NETFS_BUF_PAGECACHE_MARK XA_MARK_1	/* - Page needs wb/dirty flag wrangling */
> +
>  enum netfs_io_source {
>  	NETFS_FILL_WITH_ZEROES,
>  	NETFS_DOWNLOAD_FROM_SERVER,
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

