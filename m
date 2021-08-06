Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4183E2BD7
	for <lists+linux-cachefs@lfdr.de>; Fri,  6 Aug 2021 15:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628257538;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L5AEL51gj7nuc9gg5SZo0vO9mNbGASuK79aMQ+u0wQk=;
	b=XKeKTwJMEp1vYJkMCclX3bMlWUjSZ5QddXKTldpWMxxHohm3m+5LhsWjzOw7MtkksQonh9
	tdByesbovBQC25r+6EZkNLyEXaBlcKT/ZqdoYFNF9RkjeYq2SuMSlImAWEuvAfP3lovnc7
	9QY2npjupxHsTGpNhbkVT26psMyrgvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-t5GDxsP1MkaLl4p13Fc-8w-1; Fri, 06 Aug 2021 09:45:37 -0400
X-MC-Unique: t5GDxsP1MkaLl4p13Fc-8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84DF196DCE5;
	Fri,  6 Aug 2021 13:45:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1154060C13;
	Fri,  6 Aug 2021 13:45:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 267F3181A2AB;
	Fri,  6 Aug 2021 13:45:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 176Dj0Ej005781 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 6 Aug 2021 09:45:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B89265DF36; Fri,  6 Aug 2021 13:45:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.22.32.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6BD75D9D5;
	Fri,  6 Aug 2021 13:44:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YQx4lx7vEbvmfBnE@casper.infradead.org>
References: <YQx4lx7vEbvmfBnE@casper.infradead.org>
	<YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Fri, 06 Aug 2021 14:44:48 +0100
Message-ID: <1302765.1628257488@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
	linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
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
Content-ID: <1302764.1628257488.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> Filesystems should not make an assumption about this ... I suspect
> the optimum page size scales with I/O bandwidth; taking PCI bandwidth
> as a reasonable proxy, it's doubled five times in twenty years.

There are a lot more factors than you make out.  Local caching, content
crypto, transport crypto, cost of setting up RPC calls, compounding calls to
multiple servers.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

