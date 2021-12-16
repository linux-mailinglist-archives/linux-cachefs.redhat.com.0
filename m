Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5156D477994
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 17:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639673270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ijdY4xVO364Gm7VfeFc6VdjTKTatzwRAvkcM3GmpRbQ=;
	b=PEgXvcoYOuwZVYLstzNEn5asJGFjmv8nDU/kx19/JeFBHLQBftmKFxesVCH3tij8P6ym3f
	2gJjrPfWrJ6kdfuiaW/rTYZMgR7HBmS4Da19uCrGwWOTRik+/oAQOuTpTO28HXrYWJIsML
	XLtF3N09uT8IKtvAb7qaVWemKSG/WoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-ioeuKxM4Naups_hsXNkc8g-1; Thu, 16 Dec 2021 11:47:47 -0500
X-MC-Unique: ioeuKxM4Naups_hsXNkc8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A0ED100F945;
	Thu, 16 Dec 2021 16:47:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 005315BD0C;
	Thu, 16 Dec 2021 16:47:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79F1E1809CB9;
	Thu, 16 Dec 2021 16:47:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGGldUu010502 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 11:47:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70AFE1037F55; Thu, 16 Dec 2021 16:47:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E6B51037F51;
	Thu, 16 Dec 2021 16:47:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wi0H5vmka1_iWe0+Yc6bwtgWn_bEEHCMYsPHYtNJKZHCQ@mail.gmail.com>
References: <CAHk-=wi0H5vmka1_iWe0+Yc6bwtgWn_bEEHCMYsPHYtNJKZHCQ@mail.gmail.com>
	<163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
	<163967169723.1823006.2868573008412053995.stgit@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 16 Dec 2021 16:47:32 +0000
Message-ID: <1828149.1639673252@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BGGldUu010502
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	linux-afs@lists.infradead.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH v3 56/68] afs: Handle len being
	extending over page end in write_begin/write_end
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1828148.1639673252.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > With transparent huge pages, in the future, write_begin() and write_end()
> > may be passed a length parameter that, in combination with the offset into
> > the page, exceeds the length of that page.  This allows
> > grab_cache_page_write_begin() to better choose the size of THP to allocate.
> 
> I still think this is a fundamental bug in the caller. That
> "explanation" is weak, and the whole concept smells like week-old fish
> to me.

You really should ask Willy about this as it's multipage folio-related.

AIUI, because the page/folio may be allocated inside ->write_begin(),
generic_perform_write() tells the filesystem how much it has been asked to
write and then the folio allocation can be made to fit that.

However, at this time, ->write_begin() and ->write_end() have a page pointer
(or pointer-to-pointer), not a folio pointer, in their signature, so the
filesystem has to convert between them.

I'm working on write helpers for netfslib that absorb this out of the
filesystems that use it into its own take on generic_perform_write(), thereby
eliminating the need for ->write_begin and ->write_end.  I have this kind of
working for afs and 9p at the moment and am looking at ceph, but there's a way
to go yet.  I believe iomap does the same for block-based filesystems that use
it (such as xfs).

I think Willy's aim is to get rid of ->write_begin and ->write_end entirely.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

