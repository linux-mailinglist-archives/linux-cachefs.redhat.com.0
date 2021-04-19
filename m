Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E34B36457C
	for <lists+linux-cachefs@lfdr.de>; Mon, 19 Apr 2021 15:57:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-E2AwrfiEN7qseFWWt4PlFg-1; Mon, 19 Apr 2021 09:57:40 -0400
X-MC-Unique: E2AwrfiEN7qseFWWt4PlFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 892F3EC1AD;
	Mon, 19 Apr 2021 13:57:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 013175D71D;
	Mon, 19 Apr 2021 13:57:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3C6544A58;
	Mon, 19 Apr 2021 13:57:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JDvWRU029956 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 09:57:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FB4720117F9; Mon, 19 Apr 2021 13:57:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A6562138CFE
	for <linux-cachefs@redhat.com>; Mon, 19 Apr 2021 13:57:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0654C100DE82
	for <linux-cachefs@redhat.com>; Mon, 19 Apr 2021 13:57:30 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-360-_hY36hpZM06hZWiaYy8etg-1; Mon, 19 Apr 2021 09:57:27 -0400
X-MC-Unique: _hY36hpZM06hZWiaYy8etg-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lYUN6-00DqIB-2k; Mon, 19 Apr 2021 13:56:15 +0000
Date: Mon, 19 Apr 2021 14:55:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210419135528.GC2531743@casper.infradead.org>
References: <20210409185105.188284-1-willy@infradead.org>
	<20210409185105.188284-10-willy@infradead.org>
	<YH2E2jNvhEOwCinT@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
In-Reply-To: <YH2E2jNvhEOwCinT@hirez.programming.kicks-ass.net>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [PATCH v7 09/28] mm: Create FolioFlags
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 19, 2021 at 03:25:46PM +0200, Peter Zijlstra wrote:
> On Fri, Apr 09, 2021 at 07:50:46PM +0100, Matthew Wilcox (Oracle) wrote:
> > These new functions are the folio analogues of the PageFlags functions.
> > If CONFIG_DEBUG_VM_PGFLAGS is enabled, we check the folio is not a tail
> > page at every invocation.  Note that this will also catch the PagePoisoned
> > case as a poisoned page has every bit set, which would include PageTail.
> > 
> > This saves 1727 bytes of text with the distro-derived config that
> > I'm testing due to removing a double call to compound_head() in
> > PageSwapCache().
> 
> I vote for dropping the Camels if we're going to rework all this.

I'm open to that.  It's a bit of rework now, but easier to do it as
part of this than as a separate series.

So, concretely:

PageReferences() becomes folio_referenced()
SetPageReferenced() becomes folio_set_referenced()
ClearPageReferenced() becomes folio_clear_referenced()
__SetFolioReferenced() becomes __folio_set_referenced()
__ClearFolioReferenced() becomes __folio_clear_referenced()
TestSetPageReferenced() becomes folio_test_set_referenced()
TestClearPageReferenced() becomes folio_test_clear_referenced()

We do have some functions already like set_page_writeback(), but I
think those can become folio_set_writeback() without doing any harm.
We also have page_is_young(), page_is_pfmemalloc(), page_is_guard(),
etc.  Should it be folio_referenced()?  or folio_is_referenced()?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

