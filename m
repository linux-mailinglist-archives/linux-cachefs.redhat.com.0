Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D6F583A662E
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Jun 2021 13:59:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-zzAmaohPPcKoLRxSmL5zPQ-1; Mon, 14 Jun 2021 07:59:32 -0400
X-MC-Unique: zzAmaohPPcKoLRxSmL5zPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE0451926DA0;
	Mon, 14 Jun 2021 11:59:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3C2C10016F4;
	Mon, 14 Jun 2021 11:59:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA8F946F59;
	Mon, 14 Jun 2021 11:59:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15EBxRNP023237 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Jun 2021 07:59:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 898244405B; Mon, 14 Jun 2021 11:59:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 728B62EF97
	for <linux-cachefs@redhat.com>; Mon, 14 Jun 2021 11:59:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30CBA1C3A066
	for <linux-cachefs@redhat.com>; Mon, 14 Jun 2021 11:59:24 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-516---S2j9c9N0eMPnXgA0HhaA-1; Mon, 14 Jun 2021 07:59:22 -0400
X-MC-Unique: --S2j9c9N0eMPnXgA0HhaA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lslEx-005Nir-3j; Mon, 14 Jun 2021 11:59:02 +0000
Date: Mon, 14 Jun 2021 12:58:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YMdEe+d2SA5MBrT7@casper.infradead.org>
References: <4d1c9cf43d336b32dceabd2a28e9f68937c2e7a9.camel@kernel.org>
	<20210613233345.113565-1-jlayton@kernel.org>
	<338981.1623665093@warthog.procyon.org.uk>
	<348581.1623671134@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <348581.1623671134@warthog.procyon.org.uk>
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
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	linux-cachefs@redhat.com, pfmeec@rit.edu, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: fix test for whether we can skip
 read when writing beyond EOF
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 14, 2021 at 12:45:34PM +0100, David Howells wrote:
> Jeff Layton <jlayton@kernel.org> wrote:
> 
> > > Why not:
> > > 
> > > 	if (page_offset(page) >= i_size)
> > > 
> > 
> > That doesn't handle THP's correctly. It's just a PAGE_SIZE shift.
> 
> I asked Willy about that one and he said it will.  Now, granted, the code
> doesn't seem to do that, but possibly he has a patch for it?

a THP has its index in units of PAGE_SIZE.  If you have an order-4
page at file offset 32 * PAGE_SIZE, it will have page->index set to 32.
So shifting by PAGE_SIZE is correct.  This contrasts with the insanity
of hugetlbfs which has its index in units of the hpage_size.

The only thing is that you have to pass around the head page.  tail->index
is meaningless.  But you should always be passing around the head page
unless there's a really good reason not to (eg vmf->page where we really
need to know which subpage the fault was in).

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

