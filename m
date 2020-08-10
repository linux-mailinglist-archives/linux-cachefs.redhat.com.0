Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8B158241153
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 22:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597089869;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6VD92ioGXHtVdBLRIji3RB1uwXthkNyZ6HHlqFyNyyo=;
	b=ajHbB3pU9douYZjHZHq1TRCPmMCjKtHeY+D122XDgYT2RiY2MVkjN0hZRmeJBPaLGouNj0
	0f6lsKBR8DbMAdpQ745z6YA6Y+csuCN6HSHhe0tNQBqHvQWBTnQSjO9leIiiUU6bgr3PKo
	UwT5oO0I7tk6qzf9BU6dWdntcQEFfGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-rzgvI_BbMHO90nA04TjY-w-1; Mon, 10 Aug 2020 16:04:27 -0400
X-MC-Unique: rzgvI_BbMHO90nA04TjY-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE655107ACCA;
	Mon, 10 Aug 2020 20:04:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0337310013C2;
	Mon, 10 Aug 2020 20:04:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0DD91809557;
	Mon, 10 Aug 2020 20:04:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AFmGGC013041 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 11:48:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9967590E9B; Mon, 10 Aug 2020 15:48:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-113-69.rdu2.redhat.com
	[10.10.113.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCC8C7B92F;
	Mon, 10 Aug 2020 15:48:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAH2r5msKipj1exNUDaSUN7h0pjanOenhSg2=EWYMv_h15yKtxg@mail.gmail.com>
References: <CAH2r5msKipj1exNUDaSUN7h0pjanOenhSg2=EWYMv_h15yKtxg@mail.gmail.com>
	<447452.1596109876@warthog.procyon.org.uk>
	<1851200.1596472222@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
To: Steve French <smfrench@gmail.com>
MIME-Version: 1.0
Content-ID: <672168.1597074488.1@warthog.procyon.org.uk>
Date: Mon, 10 Aug 2020 16:48:08 +0100
Message-ID: <672169.1597074488@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 10 Aug 2020 16:04:18 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, CIFS <linux-cifs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Steve French <smfrench@gmail.com> wrote:

> cifs.ko also can set rsize quite small (even 1K for example, although
> that will be more than 10x slower than the default 4MB so hopefully no
> one is crazy enough to do that).

You can set rsize < PAGE_SIZE?

> I can't imagine an SMB3 server negotiating an rsize or wsize smaller than
> 64K in today's world (and typical is 1MB to 8MB) but the user can specify a
> much smaller rsize on mount.  If 64K is an adequate minimum, we could change
> the cifs mount option parsing to require a certain minimum rsize if fscache
> is selected.

I've borrowed the 256K granule size used by various AFS implementations for
the moment.  A 512-byte xattr can thus hold a bitmap covering 1G of file
space.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

