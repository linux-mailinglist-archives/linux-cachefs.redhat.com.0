Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 224953E9320
	for <lists+linux-cachefs@lfdr.de>; Wed, 11 Aug 2021 15:58:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-0f6H_HtQNQ-k60FK37nacw-1; Wed, 11 Aug 2021 09:58:43 -0400
X-MC-Unique: 0f6H_HtQNQ-k60FK37nacw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C00F5801AEB;
	Wed, 11 Aug 2021 13:58:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6D8E781E8;
	Wed, 11 Aug 2021 13:58:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36984181AC06;
	Wed, 11 Aug 2021 13:58:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17BDtYt3029840 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 11 Aug 2021 09:55:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B3922038B93; Wed, 11 Aug 2021 13:55:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9287E2077FC7
	for <linux-cachefs@redhat.com>; Wed, 11 Aug 2021 13:55:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AEFA185A794
	for <linux-cachefs@redhat.com>; Wed, 11 Aug 2021 13:55:32 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-491-Z3R9ABDYMQiL4zepUsIyFQ-1; Wed, 11 Aug 2021 09:55:28 -0400
X-MC-Unique: Z3R9ABDYMQiL4zepUsIyFQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mDogz-00DTvn-6N; Wed, 11 Aug 2021 13:55:02 +0000
Date: Wed, 11 Aug 2021 14:54:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YRPWqRVfRLtY7CyF@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 11, 2021 at 02:07:51PM +0100, David Howells wrote:
> Convert the netfs helper library and the afs filesystem to use folios.
> 
> NOTE: This patch will also need to alter the ceph filesystem, but as that's
> not been done that yet, ceph will fail to build.
> 
> The patch makes two alterations to the mm headers:
> 
>  (1) Fix a bug in readahead_folio() where a NULL return from
>      __readahead_folio() will cause folio_put() to oops.

I'll fold that in.

>  (2) Add folio_change_private() to change the private data on the folio
>      without adjusting the page refcount or changing the flag.  This
>      assumes folio_attach_private() was already called.

Makes sense.

>  (*) Should I be using page_mapping() or page_file_mapping()?

Depends if you can have a swapfile on your filesystem.  I'd like to
get rid of this and only use the directIO path for swap, but that's a
far-distant project.

>  (*) Can page_endio() be split into two separate functions, one for read
>      and one for write?  If seems a waste of time to conditionally switch
>      between two different branches.

So you'd like a folio_end_write() and folio_end_read()?

>  (*) Is there a better way to implement afs_kill_pages() and
>      afs_redirty_pages()?  I was previously using find_get_pages_contig()
>      into a pagevec, but that doesn't look like it'll work with folios, so
>      I'm now calling filemap_get_folio() a lot more - not that it matters
>      so much, as these are failure paths.

I always disliked the _contig variants.  Block filesystems tend to
follow the pattern

	for-each-page-in-range
		if page-is-contig-with-prev
			append-to-bio
		else
			start-new-bio

while network filesystems tend to use the pattern

	for-range
		get-a-batch-of-contig-pages
			submit-an-io-using-these-pages

it'd be nice to follow the same pattern for both.  Would reduce the
amount of duplicated infrastructure.

>      Also, should these be moved into generic code?

I'd have to figure out what they do to answer this question.

>  (*) Can ->page_mkwrite() see which subpage of a folio got hit?

It already does -- you're passed a page, not a folio.  Are you trying
to optimise by only marking part of a folio as dirty?  If so, that's a
bad idea because we're going to want to, eg, map 64KB chunks of a folio
with a single TLB entry on ARM, so you'll only get one notification for
that page.

>  (*) __filemap_get_folio() should be used instead of
>      grab_cache_page_write_begin()?  What should be done if xa_is_value()
>      returns true on the value returned by that?

If you don't pass FGP_ENTRY, it won't return you an xa_is_value() ...

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

