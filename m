Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B866359D23
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 13:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617967156;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S+RxSmNux4UPBU4Zh/6HZ2qQ7i+ocwJ2uQm+0Z2/RNs=;
	b=ZV0eMC2jfyx2ygpwUSBYZIEZp/QghoORf8f1z67ldI/LOiwgejH8E2ZOs3x6f86/u1ql8b
	ALVpBAVKB/gXxA7qbxl/zEzyALTuBZHKqZ3/KtU+eYEFbT9sjzB8CPrFmhcCxI7XUJZs7D
	qpYP16gR8Pm81QEpzP96c2OCbRx+59Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-rgxVULpbMOOoqrGkf7muHg-1; Fri, 09 Apr 2021 07:19:15 -0400
X-MC-Unique: rgxVULpbMOOoqrGkf7muHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85622801814;
	Fri,  9 Apr 2021 11:19:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F66F669EC;
	Fri,  9 Apr 2021 11:19:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31CD11806D10;
	Fri,  9 Apr 2021 11:19:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 138FPfJB004969 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 8 Apr 2021 11:25:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4AAC104254C; Thu,  8 Apr 2021 15:25:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD1710013C1;
	Thu,  8 Apr 2021 15:25:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210408145057.GN2531743@casper.infradead.org>
References: <20210408145057.GN2531743@casper.infradead.org>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789066013.6155.9816857201817288382.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 08 Apr 2021 16:25:34 +0100
Message-ID: <14840.1617895534@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 09 Apr 2021 07:19:11 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Steve French <sfrench@samba.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v6 02/30] mm: Add set/end/wait functions
	for PG_private_2
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
Content-ID: <14839.1617895534.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> > +void end_page_private_2(struct page *page)
> > +{
> > +	page = compound_head(page);
> > +	VM_BUG_ON_PAGE(!PagePrivate2(page), page);
> > +	clear_bit_unlock(PG_private_2, &page->flags);
> > +	wake_up_page_bit(page, PG_private_2);
> 
> ... but when we try to end on a tail, we actually wake up the head ...

Question is, should I remove compound_head() here or add it into the other
functions?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

