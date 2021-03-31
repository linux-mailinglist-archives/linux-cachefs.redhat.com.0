Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 002C035064B
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 20:29:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-llH0IyVCOyOKjwSKcLpjSg-1; Wed, 31 Mar 2021 14:29:31 -0400
X-MC-Unique: llH0IyVCOyOKjwSKcLpjSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 741401005D4F;
	Wed, 31 Mar 2021 18:29:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A226639A50;
	Wed, 31 Mar 2021 18:29:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28D8B1809C83;
	Wed, 31 Mar 2021 18:29:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VITN53002231 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 14:29:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29E2D112C078; Wed, 31 Mar 2021 18:29:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 252F6114B31E
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:29:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 964D4805F43
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:29:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-520-a0HcFUzxMuifmgVYSslGLw-1; Wed, 31 Mar 2021 14:29:18 -0400
X-MC-Unique: a0HcFUzxMuifmgVYSslGLw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRfaD-004xa8-Hb; Wed, 31 Mar 2021 18:28:53 +0000
Date: Wed, 31 Mar 2021 19:28:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <20210331182849.GZ351017@casper.infradead.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
	<20210322184744.GU1719932@casper.infradead.org>
	<YFqH3B80Gn8pcPqB@cmpxchg.org>
	<20210324062421.GQ1719932@casper.infradead.org>
	<YF4eX/VBPLmontA+@cmpxchg.org>
	<20210329165832.GG351017@casper.infradead.org>
	<YGN8biqigvPP0SGN@cmpxchg.org>
	<20210330210929.GR351017@casper.infradead.org>
	<YGS76CfjNc2jfYQ7@cmpxchg.org>
MIME-Version: 1.0
In-Reply-To: <YGS76CfjNc2jfYQ7@cmpxchg.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 31, 2021 at 02:14:00PM -0400, Johannes Weiner wrote:
> Anyway, we digressed quite far here. My argument was simply that it's
> conceivable we'll switch to a default allocation block and page size
> that is larger than the smallest paging size supported by the CPU and
> the kernel. (Various architectures might support multiple page sizes,
> but once you pick one, that's the smallest quantity the kernel pages.)

We've had several attempts in the past to make 'struct page' refer to
a different number of bytes than the-size-of-a-single-pte, and they've
all failed in one way or another.  I don't think changing PAGE_SIZE to
any other size is reasonable.

Maybe we have a larger allocation unit in the future, maybe we do
something else, but that should have its own name, not 'struct page'.
I think the shortest path to getting what you want is having a superpage
allocator that the current page allocator can allocate from.  When a
superpage is allocated from the superpage allocator, we allocate an
array of struct pages for it.

> I don't think folio as an abstraction is cooked enough to replace such
> a major part of the kernel with it. so I'm against merging it now.
> 
> I would really like to see a better definition of what it actually
> represents, instead of a fluid combination of implementation details
> and conveniences.

Here's the current kernel-doc for it:

/**
 * struct folio - Represents a contiguous set of bytes.
 * @flags: Identical to the page flags.
 * @lru: Least Recently Used list; tracks how recently this folio was used.
 * @mapping: The file this page belongs to, or refers to the anon_vma for
 *    anonymous pages.
 * @index: Offset within the file, in units of pages.  For anonymous pages,
 *    this is the index from the beginning of the mmap.
 * @private: Filesystem per-folio data (see attach_folio_private()).
 *    Used for swp_entry_t if FolioSwapCache().
 * @_mapcount: How many times this folio is mapped to userspace.  Use
 *    folio_mapcount() to access it.
 * @_refcount: Number of references to this folio.  Use folio_ref_count()
 *    to read it.
 * @memcg_data: Memory Control Group data.
 *
 * A folio is a physically, virtually and logically contiguous set
 * of bytes.  It is a power-of-two in size, and it is aligned to that
 * same power-of-two.  It is at least as large as %PAGE_SIZE.  If it is
 * in the page cache, it is at a file offset which is a multiple of that
 * power-of-two.
 */
struct folio {
        /* private: don't document the anon union */
        union {
                struct {
        /* public: */
                        unsigned long flags;
                        struct list_head lru;
                        struct address_space *mapping;
                        pgoff_t index;
                        unsigned long private;
                        atomic_t _mapcount;
                        atomic_t _refcount;
#ifdef CONFIG_MEMCG
                        unsigned long memcg_data;
#endif
        /* private: the union with struct page is transitional */
                };
                struct page page;
        };
};

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

