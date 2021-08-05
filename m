Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 650A23E1F80
	for <lists+linux-cachefs@lfdr.de>; Fri,  6 Aug 2021 01:48:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-CPnMkV_TMkqUGNbQPpvidQ-1; Thu, 05 Aug 2021 19:48:31 -0400
X-MC-Unique: CPnMkV_TMkqUGNbQPpvidQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F90F92500;
	Thu,  5 Aug 2021 23:48:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 607EC60CA1;
	Thu,  5 Aug 2021 23:48:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59F7B4BB7C;
	Thu,  5 Aug 2021 23:48:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 175NmMPS012742 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 5 Aug 2021 19:48:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DC1D1041AFC; Thu,  5 Aug 2021 23:48:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6944A1041AF9
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 23:48:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01A6101A54C
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 23:48:19 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-297-v7HgiBMyMTWhMWVLcfV9cQ-1; Thu, 05 Aug 2021 19:48:18 -0400
X-MC-Unique: v7HgiBMyMTWhMWVLcfV9cQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mBn5L-007d2p-Uz; Thu, 05 Aug 2021 23:47:39 +0000
Date: Fri, 6 Aug 2021 00:47:35 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YQx4lx7vEbvmfBnE@casper.infradead.org>
References: <YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1219713.1628181333@warthog.procyon.org.uk>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] Canvassing for network filesystem write size vs
	page size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 05, 2021 at 05:35:33PM +0100, David Howells wrote:
> With Willy's upcoming folio changes, from a filesystem point of view, we're
> going to be looking at folios instead of pages, where:
> 
>  - a folio is a contiguous collection of pages;
> 
>  - each page in the folio might be standard PAGE_SIZE page (4K or 64K, say) or
>    a huge pages (say 2M each);

This is not a great way to explain folios.

If you're familiar with compound pages, a folio is a new type for
either a base page or the head page of a compound page; nothing more
and nothing less.

If you're not familiar with compound pages, a folio contains 2^n
contiguous pages.  They are treated as a single unit.

>  - a folio has one dirty flag and one writeback flag that applies to all
>    constituent pages;
> 
>  - a complete folio currently is limited to PMD_SIZE or order 8, but could
>    theoretically go up to about 2GiB before various integer fields have to be
>    modified (not to mention the memory allocator).

Filesystems should not make an assumption about this ... I suspect
the optimum page size scales with I/O bandwidth; taking PCI bandwidth
as a reasonable proxy, it's doubled five times in twenty years.

> Willy is arguing that network filesystems should, except in certain very
> special situations (eg. O_SYNC), only write whole folios (limited to EOF).

I did also say that the write could be limited by, eg, a byte-range
lease on the file.  If the client doesn't have permission to write
a byte range, then it doesn't need to write it back.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

