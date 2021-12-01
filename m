Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B854649C0
	for <lists+linux-cachefs@lfdr.de>; Wed,  1 Dec 2021 09:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638347582;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kEoNu+btX06mdOy9jWOr4JytDcinYPRdcm4UjqEGwCw=;
	b=Nc2VC7qQfE6NBbLaJpllEeejjb5kzmrDRf3G3pFlZvaCoqea21JJKButPskjNVnyhuf63J
	EOL92k+2cyTAY4rIFZqt2NeDJjFijF7+fGL1HOrdWNQ1NyOv9WZEM3qCxYtxtbVr+tvdho
	xhaDlfQJGnCi2kI9xpP9x1fuUOWvZqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-Hq7JrKTOPr2xyfVFAXXFGg-1; Wed, 01 Dec 2021 03:32:59 -0500
X-MC-Unique: Hq7JrKTOPr2xyfVFAXXFGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8531B835E20;
	Wed,  1 Dec 2021 08:32:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 767E710016F7;
	Wed,  1 Dec 2021 08:32:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 763934BB7C;
	Wed,  1 Dec 2021 08:32:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B18TUCW021976 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 1 Dec 2021 03:29:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B0FF876612; Wed,  1 Dec 2021 08:29:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A14EB4D73A;
	Wed,  1 Dec 2021 08:29:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <bcefb8f2-576a-b3fc-cc29-89808ebfd7c1@linux.alibaba.com>
References: <bcefb8f2-576a-b3fc-cc29-89808ebfd7c1@linux.alibaba.com>
	<163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
	<163819640393.215744.15212364106412961104.stgit@warthog.procyon.org.uk>
To: JeffleXu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Wed, 01 Dec 2021 08:29:25 +0000
Message-ID: <571668.1638347365@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 44/64] cachefiles: Implement key to
	filename encoding
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
Content-ID: <571667.1638347365.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

JeffleXu <jefflexu@linux.alibaba.com> wrote:

> > +	/* If the path is usable ASCII, then we render it directly */
> > +	if (print) {
> > +		len = 1 + keylen + 1;
> > +		name = kmalloc(len, GFP_KERNEL);
> > +		if (!name)
> > +			return false;
> > +
> > +		name[0] = 'D'; /* Data object type, string encoding */
> > +		name[1 + keylen] = 0;
> > +		memcpy(name + 1, key, keylen);
> > +		goto success;
> 			^
> If we goto success from here,
> ...
> > +
> > +success:
> > +	name[len] = 0;
> 	     ^
> then it seems that this will cause an out-of-boundary access.

You're right.  I'll change that to:

		len = 1 + keylen;
		name = kmalloc(len + 1, GFP_KERNEL);

and I shouldn't need:

		name[1 + keylen] = 0;

as that's also done after the success label.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

