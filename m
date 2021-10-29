Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699844018A
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Oct 2021 19:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635530150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GRieGq5nEeluQlAjmlm6uNtMfN608CAvqdr0wkkDVTI=;
	b=IH0AD9jOgfC61UhEuJebWMPsWbJhpC7O2Du4bgmAPmwdM0CVEnpyrZPImCCS2g/gpIkBZJ
	BURK/Hj/AaMOKeY+mBNNdBu/p/nMGUJ7vGSGzICasKb9fVNjJpTo0tOnlY/RQB2NhWfiF6
	uynPQjYI46HzXCtIPbgZnXE8+eYBDww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-9gV5XsroPyWFYqWAUWk4_Q-1; Fri, 29 Oct 2021 13:55:47 -0400
X-MC-Unique: 9gV5XsroPyWFYqWAUWk4_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9E2110A8E01;
	Fri, 29 Oct 2021 17:55:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98BCF60854;
	Fri, 29 Oct 2021 17:55:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AE144A703;
	Fri, 29 Oct 2021 17:55:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19THtalq001954 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 13:55:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77A8260CA1; Fri, 29 Oct 2021 17:55:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6985560C13;
	Fri, 29 Oct 2021 17:55:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wiy4KNREEqvd10Ku8VVSY1Lb=fxTA1TzGmqnLaHM3gdTg@mail.gmail.com>
References: <CAHk-=wiy4KNREEqvd10Ku8VVSY1Lb=fxTA1TzGmqnLaHM3gdTg@mail.gmail.com>
	<163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Fri, 29 Oct 2021 18:55:24 +0100
Message-ID: <1889041.1635530124@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, linux-afs@lists.infradead.org,
	CIFS <linux-cifs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 00/10] fscache: Replace and remove
	old I/O API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1889040.1635530124.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

>  - it would be much better if you could incrementally just improve the
> existing FSCACHE so that it just _works_ all the time, and fixes the
> problems in it, and a bisection works, and there is no flag-day.

As I stated in the cover letters, the advent of the kiocb and tmpfile
interfaces provide a way to massively simplify the way fscache and cachefiles
work - and, as a result, remove over five thousand lines of code.

With the changes I'm looking at making, I can get rid of the object state
machine as it stands and the operation scheduling - which means all of the
code in:

	fs/fscache/object.c
	fs/fscache/operation.c

gets deleted along with:

	fs/fscache/page.c
	fs/cachefiles/rdwr.c

when I remove the deprecated I/O code (which is what this patchset does).

A large chunk of code in fs/fscache/cookie.c gets removed and replaced too

Further, I've been looking at simplifying the index management with an eye to
completely replacing the cache backend with something more akin to a tagged
cache with fixed-size storage units.  This also allows the cachefiles code to
be simplified a bit too.

This means bisection is of limited value and why I'm looking at a 'flag day'.


There is one particular problem that *this* patchset was intended to address:
I want to convert the filesystems that are going to be accessing fscache to
use netfslib, but they're not all there yet so that there's one common body of
code that does VM interface, cache I/O and content crypto (eg. fscrypt).  Jeff
and I have converted afs and ceph already and I've got a conversion for 9p in
this patchset.  I have a partial patch for cifs/smb and have been discussing
that with Steve and Shyam.  Dave Wysochanski has a set of patches for nfs, but
there's pushback on it from the nfs maintainers.

This particular patchset is intended to enable removal of the old I/O routines
by changing nfs and cifs to use a "fallback" method to use the new kiocb-using
API and thus allow me to get on with the rest of it.

However, if you would rather I just removed all of fscache and (most of[*])
cachefiles, that I can do.  I have the patches arrayed in a way that makes
them easier to explain logically and, hopefully, easier to review.  It would,
however, leave any netfs that isn't converted to use netfslib unable to use
caching until converted.

David

[*] The code that deals with the cachefilesd UAPI will be mostly unchanged.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

