Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 716323514B9
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Apr 2021 14:07:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-4KetvuktN3C6XE6ZysWmqw-1; Thu, 01 Apr 2021 08:07:35 -0400
X-MC-Unique: 4KetvuktN3C6XE6ZysWmqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4505E1922962;
	Thu,  1 Apr 2021 12:07:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7CFE646D6;
	Thu,  1 Apr 2021 12:07:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 569134BB7B;
	Thu,  1 Apr 2021 12:07:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 131C7SAc013001 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 08:07:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F7AA2026D6A; Thu,  1 Apr 2021 12:07:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02F662026D2E
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 12:07:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4709B858EEE
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 12:07:25 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-457-sFp41BXcN4iiPkLGrg6GKQ-1; Thu, 01 Apr 2021 08:07:20 -0400
X-MC-Unique: sFp41BXcN4iiPkLGrg6GKQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRw6I-00669P-7s; Thu, 01 Apr 2021 12:07:04 +0000
Date: Thu, 1 Apr 2021 13:07:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20210401120702.GB351017@casper.infradead.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
	<20210322184744.GU1719932@casper.infradead.org>
	<YFqH3B80Gn8pcPqB@cmpxchg.org>
	<20210324062421.GQ1719932@casper.infradead.org>
	<YF4eX/VBPLmontA+@cmpxchg.org>
	<20210329165832.GG351017@casper.infradead.org>
	<YGN8biqigvPP0SGN@cmpxchg.org>
	<20210330210929.GR351017@casper.infradead.org>
	<YGVUobKUMUtEy1PS@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YGVUobKUMUtEy1PS@zeniv-ca.linux.org.uk>
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v5 00/27] Memory Folios
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

On Thu, Apr 01, 2021 at 05:05:37AM +0000, Al Viro wrote:
> On Tue, Mar 30, 2021 at 10:09:29PM +0100, Matthew Wilcox wrote:
> 
> > That's a very Intel-centric way of looking at it.  Other architectures
> > support a multitude of page sizes, from the insane ia64 (4k, 8k, 16k, then
> > every power of four up to 4GB) to more reasonable options like (4k, 32k,
> > 256k, 2M, 16M, 128M).  But we (in software) shouldn't constrain ourselves
> > to thinking in terms of what the hardware currently supports.  Google
> > have data showing that for their workloads, 32kB is the goldilocks size.
> > I'm sure for some workloads, it's much higher and for others it's lower.
> > But for almost no workload is 4kB the right choice any more, and probably
> > hasn't been since the late 90s.
> 
> Out of curiosity I looked at the distribution of file sizes in the
> kernel tree:
> 71455 files total
> 0--4Kb		36702
> 4--8Kb		11820
> 8--16Kb		10066
> 16--32Kb	6984
> 32--64Kb	3804
> 64--128Kb	1498
> 128--256Kb	393
> 256--512Kb	108
> 512Kb--1Mb	35
> 1--2Mb		25
> 2--4Mb		5
> 4--6Mb		7
> 6--8Mb		4
> 12Mb		2 
> 14Mb		1
> 16Mb		1
> 
> ... incidentally, everything bigger than 1.2Mb lives^Wshambles under
> drivers/gpu/drm/amd/include/asic_reg/

I'm just going to edit this table to add a column indicating ratio
to previous size:

> Page size	Footprint
> 4Kb		1128Mb
> 8Kb		1324Mb		1.17
> 16Kb		1764Mb		1.33
> 32Kb		2739Mb		1.55
> 64Kb		4832Mb		1.76
> 128Kb		9191Mb		1.90
> 256Kb		18062Mb		1.96
> 512Kb		35883Mb		1.98
> 1Mb		71570Mb		1.994
> 2Mb		142958Mb	1.997
> 
> So for kernel builds (as well as grep over the tree, etc.) uniform 2Mb pages
> would be... interesting.

Yep, that's why I opted for a "start out slowly and let readahead tell me
when to increase the page size" approach.

I think Johannes' real problem is that slab and page cache / anon pages
are getting intermingled.  We could solve this by having slab allocate
2MB pages from the page allocator and then split them up internally
(so not all of that 2MB necessarily goes to a single slab cache, but all
of that 2MB goes to some slab cache).

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

