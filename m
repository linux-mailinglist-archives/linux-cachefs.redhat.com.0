Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 67FB531967C
	for <lists+linux-cachefs@lfdr.de>; Fri, 12 Feb 2021 00:21:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613085661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ET6f1lzzyBUp9OWQAmJche77eaWifMuiRHZ2nBg+6og=;
	b=S7MKvhZIYkQOknwrm6fDVhopj32lpmhxn4lEbJZ+eqn3oeQgQjBJ/qnKstzQT144AmyO5N
	bbwKFynX/LzpCy8trGckxKkKGLKQq0EnMyduy4tFLNvos6abt0z2efPZ8XIy5P01DOA7Ss
	/yFth3Zu7AGnrS9Q1OLQeMQGmVCuTXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-lFKESjN8MZ-00WmhqTXt-w-1; Thu, 11 Feb 2021 18:20:59 -0500
X-MC-Unique: lFKESjN8MZ-00WmhqTXt-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 399D2192CC42;
	Thu, 11 Feb 2021 23:20:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA81710016F5;
	Thu, 11 Feb 2021 23:20:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 074FD18095CB;
	Thu, 11 Feb 2021 23:20:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BNKrwE007948 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 18:20:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 660455B4A0; Thu, 11 Feb 2021 23:20:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2932F60657;
	Thu, 11 Feb 2021 23:20:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
References: <CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
	<1330473.1612974547@warthog.procyon.org.uk>
	<1330751.1612974783@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Thu, 11 Feb 2021 23:20:46 +0000
Message-ID: <27816.1613085646@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <27815.1613085646.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Also, honestly, I really *REALLY* want your commit messages to talk
> about who has been cc'd, who has been part of development, and point
> to the PUBLIC MAILING LISTS WHERE THAT DISCUSSION WAS TAKING PLACE, so
> that I can actually see that "yes, other people were involved"

Most of the development discussion took place on IRC and waving snippets of
code about in pastebin rather than email - the latency of email is just too
high.  There's not a great deal I can do about that now as I haven't kept IRC
logs.  I can do that in future if you want.

> No, I don't require this in general, but exactly because of the
> history we have, I really really want to see that. I want to see a
>
>    Link: https://lore.kernel.org/r/....

I can add links to where I've posted the stuff for review.  Do you want this
on a per-patch basis or just in the cover for now?

Also, do you want things like these:

 https://lore.kernel.org/linux-fsdevel/3326.1579019665@warthog.procyon.org.uk/
 https://lore.kernel.org/linux-fsdevel/4467.1579020509@warthog.procyon.org.uk/

which pertain to the overall fscache rewrite, but where the relevant changes
didn't end up included in this particular patchset?  Or this:

 https://listman.redhat.com/archives/linux-cachefs/2020-December/msg00000.html

where someone was testing the overall patchset of which this is a subset?

> and the Cc's - or better yet, the Reviewed-by's etc - so that when I
> get a pull request, it really is very obvious to me when I look at it
> that others really have been involved.
> 
> So if I continue to see just
> 
>     Signed-off-by: David Howells <dhowells@redhat.com>
> 
> at the end of the commit messages, I will not pull.
> 
> Yes, in this thread a couple of people have piped up and said that
> they were part of the discussion and that they are interested, but if
> I have to start asking around just to see that, then it's too little,
> too late.
> 
> No more of this "it looks like David Howells did things in private". I
> want links I can follow to see the discussion, and I really want to
> see that others really have been involved.
> 
> Ok?

Sure.

I can go and edit in link pointers into the existing patches if you want and
add Jeff's Review-and-tested-by into the appropriate ones.  You would be able
to compare against the existing tag, so it wouldn't entirely invalidate the
testing.

Also, do you want links inserting into all the patches of the two keyrings
pull requests I've sent you?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

