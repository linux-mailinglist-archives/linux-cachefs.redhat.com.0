Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7A934D666
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Mar 2021 19:57:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-qemmGyEkN-GYCXeV1V-s4Q-1; Mon, 29 Mar 2021 13:57:03 -0400
X-MC-Unique: qemmGyEkN-GYCXeV1V-s4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EF3E87A82A;
	Mon, 29 Mar 2021 17:57:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 131736EF65;
	Mon, 29 Mar 2021 17:57:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F0C71809C83;
	Mon, 29 Mar 2021 17:56:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12THut4u000345 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 13:56:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4AE432026D11; Mon, 29 Mar 2021 17:56:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 455DA2026D64
	for <linux-cachefs@redhat.com>; Mon, 29 Mar 2021 17:56:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2D448007DD
	for <linux-cachefs@redhat.com>; Mon, 29 Mar 2021 17:56:49 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-454-swyIjDbGOfWomgOtE58MfA-1; Mon, 29 Mar 2021 13:56:47 -0400
X-MC-Unique: swyIjDbGOfWomgOtE58MfA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lQw7k-001uZf-GA; Mon, 29 Mar 2021 17:56:27 +0000
Date: Mon, 29 Mar 2021 18:56:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <20210329175624.GI351017@casper.infradead.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
	<20210322184744.GU1719932@casper.infradead.org>
	<YFqH3B80Gn8pcPqB@cmpxchg.org>
	<20210324062421.GQ1719932@casper.infradead.org>
	<YF4eX/VBPLmontA+@cmpxchg.org>
	<20210329165832.GG351017@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210329165832.GG351017@casper.infradead.org>
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
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

On Mon, Mar 29, 2021 at 05:58:32PM +0100, Matthew Wilcox wrote:
> In broad strokes, I think that having a Power Of Two Allocator
> with Descriptor (POTAD) is a useful foundational allocator to have.
> The specific allocator that we call the buddy allocator is very clever for
> the 1990s, but touches too many cachelines to be good with today's CPUs.
> The generalisation of the buddy allocator to the POTAD lets us allocate
> smaller quantities (eg a 512 byte block) and allocate descriptors which
> differ in size from a struct page.  For an extreme example, see xfs_buf
> which is 360 bytes and is the descriptor for an allocation between 512
> and 65536 bytes.
> 
> There are times when we need to get from the physical address to
> the descriptor, eg memory-failure.c or get_user_pages().  This is the
> equivalent of phys_to_page(), and it's going to have to be a lookup tree.
> I think this is a role for the Maple Tree, but it's not ready yet.
> I don't know if it'll be fast enough for this case.  There's also the
> need (particularly for memory-failure) to determine exactly what kind
> of descriptor we're dealing with, and also its size.  Even its owner,
> so we can notify them of memory failure.

A couple of things I forgot to mention ...

I'd like the POTAD to be not necessarily tied to allocating memory.
For example, I think it could be used to allocate swap space.  eg the swap
code could register the space in a swap file as allocatable through the
POTAD, and then later ask the POTAD to allocate a POT from the swap space.

The POTAD wouldn't need to be limited to MAX_ORDER.  It should be
perfectly capable of allocating 1TB if your machine has 1.5TB of RAM
in it (... and things haven't got too fragmented)

I think the POTAD can be used to replace the CMA.  The CMA supports
weirdo things like "Allocate 8MB of memory at a 1MB alignment", and I
think that's doable within the data structures that I'm thinking about
for the POTAD.  It'd first try to allocate an 8MB chunk at 8MB alignment,
and then if that's not possible, try to allocate two adjacent 4MB chunks;
continuing down until it finds that there aren't 8x1MB chunks, at which
point it can give up.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

