Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 83CC134647B
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 17:09:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-qh16Jsj3Pny7sGZiXT9lOQ-1; Tue, 23 Mar 2021 12:09:31 -0400
X-MC-Unique: qh16Jsj3Pny7sGZiXT9lOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A5A83DD22;
	Tue, 23 Mar 2021 16:09:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A96AA5C1C5;
	Tue, 23 Mar 2021 16:09:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28E951809C82;
	Tue, 23 Mar 2021 16:09:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NG9K0K020433 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 12:09:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78F8921CAC6D; Tue, 23 Mar 2021 16:09:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CD121CAC6E
	for <linux-cachefs@redhat.com>; Tue, 23 Mar 2021 16:09:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5E65185A7B2
	for <linux-cachefs@redhat.com>; Tue, 23 Mar 2021 16:09:15 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-588-Krx6pVVIOuWuNMD9Q6VNww-1; Tue, 23 Mar 2021 12:09:14 -0400
X-MC-Unique: Krx6pVVIOuWuNMD9Q6VNww-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lOjIu-00AF00-Ng; Tue, 23 Mar 2021 15:50:50 +0000
Date: Tue, 23 Mar 2021 15:50:48 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <20210323155048.GB2438080@infradead.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
MIME-Version: 1.0
In-Reply-To: <YFja/LRC1NI6quL6@cmpxchg.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 22, 2021 at 01:59:24PM -0400, Johannes Weiner wrote:
> If that is the case, shouldn't there in the long term only be very
> few, easy to review instances of things like compound_head(),
> PAGE_SIZE etc. deep in the heart of MM? And everybody else should 1)
> never see tail pages and 2) never assume a compile-time page size?

Probably.

> But this part is already getting better, and has gotten better, with
> the page cache (largely?) going native for example.

As long as there is no strong typing it is going to remain a mess.

> So I fully agree with the motivation behind this patch. But I do
> wonder why it's special-casing the commmon case instead of the rare
> case. It comes at a huge cost. Short term, the churn of replacing
> 'page' with 'folio' in pretty much all instances is enormous.

The special case is in the eye of the beholder.  I suspect we'll end
up using the folio in most FS/VM interaction eventually, which makes it
the common.  But I don't see how it is the special case?  Yes, changing
from page to folio just about everywhere causes more change, but it also
allow to:

 a) do this gradually
 b) thus actually audit everything that we actually do the right thing

And I think willys whole series (the git branch, not just the few
patches sent out) very clearly shows the benefit of that.

> And longer term, I'm not convinced folio is the abstraction we want
> throughout the kernel. If nobody should be dealing with tail pages in
> the first place, why are we making everybody think in 'folios'? Why
> does a filesystem care that huge pages are composed of multiple base
> pages internally? This feels like an implementation detail leaking out
> of the MM code. The vast majority of places should be thinking 'page'
> with a size of 'page_size()'. Including most parts of the MM itself.

Why does the name matter?  While there are arguments both ways, the
clean break certainly helps every to remind everyone that this is not
your grandfathers fixed sized page.

> 
> The compile-time check is nice, but I'm not sure it would be that much
> more effective at catching things than a few centrally placed warns
> inside PageFoo(), get_page() etc. and other things that should not
> encounter tail pages in the first place (with __helpers for the few
> instances that do).

Eeek, no.  No amount of runtime checks is going to replace compile
time type safety.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

