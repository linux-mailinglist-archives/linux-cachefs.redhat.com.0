Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A55BE315904
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Feb 2021 22:55:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612907743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BKGqf1DxzkLkHl04ggN96FJtFJhxHnEJOjFpEesoAJo=;
	b=fSQnlR9iMAVoLPnPfGep7BKTEnRS/g7LZbLUJKqTkpaxFu/Dcbky/A3s6lWKMBurvd069F
	yM+/FVtdc0T/cvKsQyHDCTqoL4IVfYwdTEMw9ktOKSYGb9oQmQqw6GcNaxYEsvdSuhDxH7
	3gFZr8IwMeqvq1jrSCeWUZ/gRBcLvek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-O1UXIy2_PRiExFyc2U1qYA-1; Tue, 09 Feb 2021 16:55:40 -0500
X-MC-Unique: O1UXIy2_PRiExFyc2U1qYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E159D107ACC7;
	Tue,  9 Feb 2021 21:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A96F60C4D;
	Tue,  9 Feb 2021 21:55:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1FE04E58D;
	Tue,  9 Feb 2021 21:55:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119LtZlY022609 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 16:55:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 60BD61971B; Tue,  9 Feb 2021 21:55:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E37C719C78;
	Tue,  9 Feb 2021 21:55:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wh+2gbF7XEjYc=HV9w_2uVzVf7vs60BPz0gFA=+pUm3ww@mail.gmail.com>
References: <CAHk-=wh+2gbF7XEjYc=HV9w_2uVzVf7vs60BPz0gFA=+pUm3ww@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<20210209202134.GA308988@casper.infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Tue, 09 Feb 2021 21:55:26 +0000
Message-ID: <620724.1612907726@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache: I/O API modernisation and
	netfs helper library
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <620723.1612907726.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > Yeah, I have trouble with the private2 vs fscache bit too.  I've been
> > trying to persuade David that he doesn't actually need an fscache
> > bit at all; he can just increment the page's refcount to prevent it
> > from being freed while he writes data to the cache.
> 
> Does the code not hold a refcount already?

AIUI, Willy wanted me to drop the refcount and rely on PG_locked alone during
I/O triggered by the new ->readahead() method, so when it comes to setting
PG_fscache after a successful read from the server, I don't hold any page refs
- the assumption being that the waits in releasepage and invalidatepage
suffice.  If that isn't sufficient, I can make it take page refs on the pages
to be written out - that should be easy enough to do.

> Honestly, the fact that writeback doesn't take a refcount, and then
> has magic "if writeback is set, don't free" code in other parts of the
> VM layer has been a problem already, when the wakeup ended up
> "leaking" from a previous page to a new allocation.
> 
> I very much hope the fscache bit does not make similar mistakes,
> because the rest of the VM will _not_ have special "if fscache is set,
> then we won't do X" the way we do for writeback.

The VM can't do that because PG_private_2 might not be being used for
PG_fscache.  It does, however, treat PG_private_2 like PG_private when
triggering calls to releasepage and invalidatepage.

> So I think the fscache code needs to hold a refcount regardless, and
> that the fscache bit is set the page has to have a reference.
> 
> So what are the current lifetime rules for the fscache bit?

It depends which 'current' you're referring to.

The old fscache I/O API (ie. what's upstream) - in which PG_fscache is set on
a page to note that fscache knows about the page - does not keep a separate
ref on such pages.

The new fscache I/O API simplifies things.  With that, pages are only known
about for the duration of a write to the cache.  I've tried to analogise the
way PG_writeback works[*], including waiting for it in places like
invalidation, releasepage, page_mkwrite (though in the netfs, not the core VM)
as it may represent DMA.

Note that with the new I/O API, fscache and cachefiles know nothing about the
PG_fscache bit or netfs pages; they just deal with an iov_iter and a
completion function.  Dealing with PG_fscache is done by the netfs and the new
netfs helper lib.

[*] Though I see that 073861ed77b6b made a change to end_page_writeback() for
    an issue that probably affects unlock_page_fscache() too[**].

[**] This may mean that both PG_fscache and PG_writeback need to hold a ref on
     the page.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

