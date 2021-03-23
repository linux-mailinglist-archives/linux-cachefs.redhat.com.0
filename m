Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id ED079346D0D
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 23:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616538613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZvfmrxLVpdG5SWwPGFyZn/39yNSoXA15vNSokU4fyP4=;
	b=Syejq5CP/kSBHN7g1M4mDt6EFH4YMZ7W/ATvi2tHnhHOsOQgUUORKJvG7EPfVmJZMx9NH7
	x02UIr9weKJ7tTfzeMUpk0orB5n1qvP/6L0ACzwdkDvi8sWoUhoSFhNLFoo2wrFCTPwGgT
	XCCPio37ud3Bm5r7DD2J5kV0dIHQQsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-PHh19yF-MqaRe17VteWvyw-1; Tue, 23 Mar 2021 18:30:11 -0400
X-MC-Unique: PHh19yF-MqaRe17VteWvyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0C581627;
	Tue, 23 Mar 2021 22:30:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAEC15C234;
	Tue, 23 Mar 2021 22:30:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF06C4BB7B;
	Tue, 23 Mar 2021 22:30:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NM6BGc023132 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 18:06:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF08D63BA7; Tue, 23 Mar 2021 22:06:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28FFB50C0E;
	Tue, 23 Mar 2021 22:06:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2503810.1616508988@warthog.procyon.org.uk>
References: <2503810.1616508988@warthog.procyon.org.uk>
	<20210323135116.GF1719932@casper.infradead.org>
	<1885296.1616410586@warthog.procyon.org.uk>
	<20210321105309.GG3420@casper.infradead.org>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<2499407.1616505440@warthog.procyon.org.uk>
MIME-Version: 1.0
Date: Tue, 23 Mar 2021 22:06:04 +0000
Message-ID: <2769314.1616537164@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12NM6BGc023132
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Mar 2021 18:29:55 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
	PG_private_2/PG_fscache
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <2769313.1616537164.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> > > -	wait_on_page_writeback(page);
> > > +	if (wait_on_page_writeback_killable(page) < 0)
> > > +		return VM_FAULT_RETRY | VM_FAULT_LOCKED;
> > 
> > You forgot to unlock the page.
> 
> Do I need to?  Doesn't VM_FAULT_LOCKED indicate that to the caller?  Or is it
> impermissible to do it like that?

Looks like, yes, I do need to.  VM_FAULT_LOCKED is ignored if RETRY is given.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

