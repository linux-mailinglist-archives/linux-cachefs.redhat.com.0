Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A17E4254BDE
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Aug 2020 19:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598548549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0+6o+lg5MWkhGnZshP1V3SL7LsCjYszoq8uWTHPkWp8=;
	b=Z/UBTgv71bFoeErw21Soe3x9lxtNdfVxg22hr9DyZjQkRQuofS/oMbxKJSS0qYH2dMBR1m
	JXU03pYQNKyo56Q9u5srxlzdN0g9gayYeyLcRWkKvFeQCceOP9KUPJSs3GWGxwrxZVAqDj
	MV8qf3GgYLl3BbecR5mYmmE9AeGY3pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-T-63ba49M3q_2xWP3v3ApQ-1; Thu, 27 Aug 2020 13:15:45 -0400
X-MC-Unique: T-63ba49M3q_2xWP3v3ApQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5B83802B6E;
	Thu, 27 Aug 2020 17:15:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F8919D7D;
	Thu, 27 Aug 2020 17:15:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B45818408A1;
	Thu, 27 Aug 2020 17:15:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RHEu5v005933 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 13:14:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E4CA6115F; Thu, 27 Aug 2020 17:14:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-120-127.rdu2.redhat.com
	[10.10.120.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 826CC610AF;
	Thu, 27 Aug 2020 17:14:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200827161824.GC31016@nautica>
References: <20200827161824.GC31016@nautica> <20200810164044.GA31753@lst.de>
	<1851200.1596472222@warthog.procyon.org.uk>
	<447452.1596109876@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
	<1428311.1598542135@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
MIME-Version: 1.0
Content-ID: <1442568.1598548486.1@warthog.procyon.org.uk>
Date: Thu, 27 Aug 2020 18:14:46 +0100
Message-ID: <1442569.1598548486@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache rewrite -- please drop for
	now
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dominique Martinet <asmadeus@codewreck.org> wrote:

> Should I submit patches to you or wait until Linus merges it next cycle
> and send them directly?
> 
> I see Jeff's ceph patches are still in his tree's ceph-fscache-iter
> branch and I don't see them anywhere in your tree.

I really want them to all go in the same window, but there may be a
requirement for some filesystem-specific sets (eg. NFS) to go via the
maintainer tree.

Btw, at the moment, I'm looking at making the fscache read helper support the
new ->readahead() op.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

