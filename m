Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 52D5F31B38C
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 Feb 2021 01:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613348602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JqvlU+aHouaauFOGcI4Gmx45+/cRoXL739cPHxNLcdw=;
	b=YpCbxSeD98U+DMIoUqn4+hMOLS5RX0H39rbRPPyFk596A5o5ahKKO0cn6gjVTcuME6WEd1
	RLU5hDDchYnsZrigaSAPxxnUdoAoGc/R58acr5cKvQDfCfZGJIEwajeC3zpSuw/eela6A9
	BPvJsJiuzUaBaszIB1ZjESH7YQZUD7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-mp0S4Ue6NPOxzmYNa81t6w-1; Sun, 14 Feb 2021 19:23:20 -0500
X-MC-Unique: mp0S4Ue6NPOxzmYNa81t6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F14C282;
	Mon, 15 Feb 2021 00:23:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB11C1002382;
	Mon, 15 Feb 2021 00:23:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F1234E58E;
	Mon, 15 Feb 2021 00:23:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11F0N5Be004223 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 14 Feb 2021 19:23:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6DBC360939; Mon, 15 Feb 2021 00:23:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 013BD6F986;
	Mon, 15 Feb 2021 00:22:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wi68OpbwBm6RCodhNUyg6x8N7vi5ufjRtosQSPy_EYqLA@mail.gmail.com>
References: <CAHk-=wi68OpbwBm6RCodhNUyg6x8N7vi5ufjRtosQSPy_EYqLA@mail.gmail.com>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
	<1330473.1612974547@warthog.procyon.org.uk>
	<1330751.1612974783@warthog.procyon.org.uk>
	<CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
	<27816.1613085646@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Mon, 15 Feb 2021 00:22:57 +0000
Message-ID: <860729.1613348577@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11F0N5Be004223
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
Content-ID: <860728.1613348577.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> But no, it's not a replacement for actual code review after the fact.
> 
> If you think email has too long latency for review, and can't use
> public mailing lists and cc the people who are maintainers, then I
> simply don't want your patches.

I think we were talking at cross-purposes by the term "development" here.  I
was referring to the discussion of how the implementation should be done and
working closely with colleagues - both inside and outside Red Hat - to get
things working, not specifically the public review side of things.  It's just
that I don't have a complete record of the how-to-implement-it, the
how-to-get-various-bits-working-together and the why-is-it-not-working?
discussions.

Anyway, I have posted my fscache modernisation patches multiple times for
public review, I have tried to involve the wider community in aspects of the
development on public mailing lists and I have been including the maintainers
in to/cc.

I've posted the more full patchset for public review a number of times:

4th May 2020:
https://lore.kernel.org/linux-fsdevel/158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk/

13th Jul (split into three subsets):
https://lore.kernel.org/linux-fsdevel/159465766378.1376105.11619976251039287525.stgit@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk/

20th Nov:
https://lore.kernel.org/linux-fsdevel/160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk/

I then cut it down and posted that publically a couple of times:

20th Jan:
https://lore.kernel.org/linux-fsdevel/161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk/

25th Jan:
https://lore.kernel.org/linux-fsdevel/161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk/

I let you know what was coming here:
https://lore.kernel.org/linux-fsdevel/447452.1596109876@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/2522190.1612544534@warthog.procyon.org.uk/

to try and find out whether you were going to have any objections to the
design in advance, rather than at the last minute.

I've apprised people of what I was up to:
https://lore.kernel.org/lkml/24942.1573667720@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/2758811.1610621106@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/1441311.1598547738@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/160655.1611012999@warthog.procyon.org.uk/

Asked for consultation on parts of what I wanted to do:
https://lore.kernel.org/linux-fsdevel/3326.1579019665@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/4467.1579020509@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/3577430.1579705075@warthog.procyon.org.uk/

Asked someone who is actually using fscache in production to test the rewrite:
https://listman.redhat.com/archives/linux-cachefs/2020-December/msg00000.html

I've posted partial patches to try and help 9p and cifs along:
https://lore.kernel.org/linux-fsdevel/1514086.1605697347@warthog.procyon.org.uk/
https://lore.kernel.org/linux-cifs/1794123.1605713481@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/241017.1612263863@warthog.procyon.org.uk/
https://lore.kernel.org/linux-cifs/270998.1612265397@warthog.procyon.org.uk/

(Jeff has been handling Ceph and Dave NFS).

Proposed conference topics related to this:
https://lore.kernel.org/linux-fsdevel/9608.1575900019@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/14196.1575902815@warthog.procyon.org.uk/
https://lore.kernel.org/linux-fsdevel/364531.1579265357@warthog.procyon.org.uk/

though the lockdown put paid to that:-(

Willy has discussed it too:
https://lore.kernel.org/linux-fsdevel/20200826193116.GU17456@casper.infradead.org/

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

