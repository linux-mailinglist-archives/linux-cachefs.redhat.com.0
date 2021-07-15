Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AEAE03CACF8
	for <lists+linux-cachefs@lfdr.de>; Thu, 15 Jul 2021 21:46:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-jyqSb6DzPueMue1Y5Ul5bQ-1; Thu, 15 Jul 2021 15:46:25 -0400
X-MC-Unique: jyqSb6DzPueMue1Y5Ul5bQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 117371054F98;
	Thu, 15 Jul 2021 19:46:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC9C60936;
	Thu, 15 Jul 2021 19:46:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 084B918095C2;
	Thu, 15 Jul 2021 19:46:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16FJfRFW002727 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 15 Jul 2021 15:41:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4786810728E; Thu, 15 Jul 2021 19:41:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4285110728F
	for <linux-cachefs@redhat.com>; Thu, 15 Jul 2021 19:41:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4BC1185A7A4
	for <linux-cachefs@redhat.com>; Thu, 15 Jul 2021 19:41:24 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-581-WFKfGIEONPm4LFZenYfdIQ-1; Thu, 15 Jul 2021 15:41:22 -0400
X-MC-Unique: WFKfGIEONPm4LFZenYfdIQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1m47CH-003j8q-Pq; Thu, 15 Jul 2021 19:39:32 +0000
Date: Thu, 15 Jul 2021 20:39:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <YPCO1SuMyZ6j4Gno@casper.infradead.org>
References: <3398985.1626104609@warthog.procyon.org.uk>
	<20210713191101.b38013786e36286e78c9648c@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20210713191101.b38013786e36286e78c9648c@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] Request for folios
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

On Tue, Jul 13, 2021 at 07:11:01PM -0700, Andrew Morton wrote:
> > Also, is it possible to get the folios patchset in a stable public git branch
> > that I can base my patches upon?
> 
> I guess Willy's tree, but I doubt if the folio patches will be reliably
> stable for some time (a few weeks?)

So, how about I put the 89 patches which I want to merge this merge
window into a git branch which Dave can develop against?  Andrew can
pull that branch into mmotm when it's sufficiently settled for his taste.

In order for that to look good in Linus' tree, either Dave can send a
pull request which includes all of the folio patches, or I can send a
pull request early in the merge window (or even before the merge window
opens) which includes those 89 patches.

That would mean the patches wouldn't have Andrew's sign-off on them, but I
could add a R-b from Andrew to all of them if that's the right way to go.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

