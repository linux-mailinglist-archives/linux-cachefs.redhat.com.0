Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9663F3EA848
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Aug 2021 18:11:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-3kV6-k3KNkiSZcj-g9HvpQ-1; Thu, 12 Aug 2021 12:11:22 -0400
X-MC-Unique: 3kV6-k3KNkiSZcj-g9HvpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48A1B87D54C;
	Thu, 12 Aug 2021 16:11:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8DF5C25A;
	Thu, 12 Aug 2021 16:11:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7909181A0F2;
	Thu, 12 Aug 2021 16:11:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17CG8PDi019029 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 12 Aug 2021 12:08:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA33F111285C; Thu, 12 Aug 2021 16:08:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A1A10545C7
	for <linux-cachefs@redhat.com>; Thu, 12 Aug 2021 16:08:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05A3389C7DE
	for <linux-cachefs@redhat.com>; Thu, 12 Aug 2021 16:08:23 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-218-bTrDakNmPxGVPLkdCk-6qg-1; Thu, 12 Aug 2021 12:08:20 -0400
X-MC-Unique: bTrDakNmPxGVPLkdCk-6qg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mEDEc-00EkBp-FL; Thu, 12 Aug 2021 16:07:21 +0000
Date: Thu, 12 Aug 2021 17:07:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YRVHLu3OAwylCONm@casper.infradead.org>
References: <2408234.1628687271@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2408234.1628687271@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [Linux-cachefs] [RFC][PATCH] netfs, afs, ceph: Use folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 11, 2021 at 02:07:51PM +0100, David Howells wrote:
>  (*) Can page_endio() be split into two separate functions, one for read
>      and one for write?  If seems a waste of time to conditionally switch
>      between two different branches.

At this point I'm thinking ...

static inline void folio_end_read(struct folio *folio, int err)
{
	if (!err)
		folio_set_uptodate(folio);
	folio_unlock(folio);
}

Clearly the page isn't uptodate at this point, or ->readpage wouldn't've
been called.  So there's no need to clear it.  And PageError is
completely useless.

Part of this exercise was to find gaps in the API.  It looks like there
aren't too many places I missed that AFS hits.

> @@ -78,7 +78,7 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
>  			goto flush_conflicting_write;
>  	}
>  
> -	*_page = page;
> +	*_page = &folio->page;

Can't do anything about this one; the write_begin API needs to be fixed.

> @@ -87,17 +87,17 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
>  	 */
>  flush_conflicting_write:
>  	_debug("flush conflict");
> -	ret = write_one_page(page);
> +	ret = write_one_page(&folio->page);

I have folio_write_one() in my tree:

https://git.infradead.org/users/willy/pagecache.git/commitdiff/82b9f3c7b258de31bf3d3fa4cc587a6d17b5fe40

it's in the "nice to have", rather than "filesystems depend on it" pile,
so I should move it over.

> @@ -174,40 +175,32 @@ static void afs_kill_pages(struct address_space *mapping,
[...]
> +		folio_clear_uptodate(folio);
> +		folio_end_writeback(folio);
> +		folio_lock(folio);
> +		generic_error_remove_page(mapping, &folio->page);
> +		folio_unlock(folio);
> +		folio_put(folio);

This one I'm entirely missing.  It's awkward.  I'll work on it.

> @@ -497,8 +480,8 @@ static void afs_extend_writeback(struct address_space *mapping,
>  			else if (t == psize || new_content)
>  				stop = false;
>  
> -			index += thp_nr_pages(page);
> -			if (!pagevec_add(&pvec, page))
> +			index += folio_nr_pages(folio);
> +			if (!pagevec_add(&pvec, &folio->page))

Pagevecs are also awkward.  I haven't quite figured out how to
transition them to folios.

> @@ -933,29 +919,28 @@ int afs_launder_page(struct page *page)
>  	unsigned int f, t;
>  	int ret = 0;
>  
> -	_enter("{%lx}", page->index);
> +	_enter("{%lx}", folio_index(folio));
>  
> -	priv = page_private(page);
> -	if (clear_page_dirty_for_io(page)) {
> +	priv = (unsigned long)folio_get_private(folio);
> +	if (folio_clear_dirty_for_io(folio)) {
>  		f = 0;
> -		t = thp_size(page);
> -		if (PagePrivate(page)) {
> -			f = afs_page_dirty_from(page, priv);
> -			t = afs_page_dirty_to(page, priv);
> +		t = folio_size(folio);
> +		if (folio_test_private(folio)) {
> +			f = afs_folio_dirty_from(folio, priv);
> +			t = afs_folio_dirty_to(folio, priv);
>  		}
>  
> -		bv[0].bv_page = page;
> +		bv[0].bv_page = &folio->page;
>  		bv[0].bv_offset = f;
>  		bv[0].bv_len = t - f;

I should probably add a wrapper to init a bvec.

>  zero_out:
> -	zero_user_segments(page, 0, offset, offset + len, thp_size(page));
> +	zero_user_segments(&folio->page, 0, offset, offset + len, folio_size(folio));

Yeah, that's ugly.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

