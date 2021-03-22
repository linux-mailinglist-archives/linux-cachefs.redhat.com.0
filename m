Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB48344CF4
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Mar 2021 18:14:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616433246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qDq5r86Yb8j+N/yZdU0diTeYVKHGeQEbXM8AEPOtEvs=;
	b=BNLksLIqruSEm+bulxlF4X5+lfEaG/DXfgZB6RFUdVbET0mJo0n0hupF+gwihB1LY3uinp
	JrGzikDRFMSan+UoFlVKtrD0UshLiuX/DH/7NcRZIWSauy1hSJ0HNbqwk9Sg6ExriItpzc
	sdbg5JWV8hz3biAFzVk1JbYupPkxvO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-c3EzI6dFMcyHtFoe8-2I-A-1; Mon, 22 Mar 2021 13:14:04 -0400
X-MC-Unique: c3EzI6dFMcyHtFoe8-2I-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F7E3107ACCD;
	Mon, 22 Mar 2021 17:14:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A36F819D61;
	Mon, 22 Mar 2021 17:14:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 949FF1809C81;
	Mon, 22 Mar 2021 17:13:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12MHDsjw017879 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 22 Mar 2021 13:13:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7DDE5610F3; Mon, 22 Mar 2021 17:13:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8BF860C0F;
	Mon, 22 Mar 2021 17:13:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210321014202.GF3420@casper.infradead.org>
References: <20210321014202.GF3420@casper.infradead.org>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539537375.286939.16642940088716990995.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Mon, 22 Mar 2021 17:13:47 +0000
Message-ID: <2285032.1616433227@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 08/28] netfs: Provide readahead and
	readpage netfs helpers
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2285031.1616433227.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> > +	while ((page = readahead_page(ractl)))
> > +		put_page(page);
> 
> You don't need this pair of lines (unless I'm missing something).
> read_pages() in mm/readahead.c puts the reference and unlocks any
> pages which are not read by the readahead op.  Indeed, I think doing
> this is buggy because you don't unlock the page.

Actually, I do need them.  The pages haven't been removed from the ractl at
this point so just returning would cause them all to be unlocked prematurely.

I don't pass the ractl to the filesystem or the cache because I may be calling
them for partial pages, I may be issuing multiple ops sequentially on a page
and the ractl may have ceased to exist by the time I issue an op.

The unlocking is done by netfs_rreq_unlock(), even for pages that didn't get
read.

I've added a comment to this effect.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

