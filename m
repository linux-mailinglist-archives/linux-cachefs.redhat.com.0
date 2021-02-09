Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97450315701
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Feb 2021 20:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612899967;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=778oGztKjkq4EBkn3G+MhDF+OGpuUksVEnXDz27BlzQ=;
	b=GQLhJos7bQkxj3vQsBT0dY4GIvY7YWORwdnq0dt8AwIPFCFm4pdEJliSfaZpYU2i6aeYPu
	vcU8uM6o2LReyeXqPuW8oXPsiyjlYq/88EBgSYK3cEG5ugqDHOQlqhJos1cx9drOAz/fLt
	rMqqSFSPi8EKzu4V5GsTItFuKSUnfA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-uBIN_ciUOTKyvlPgH2LGRg-1; Tue, 09 Feb 2021 14:46:06 -0500
X-MC-Unique: uBIN_ciUOTKyvlPgH2LGRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3257A195D563;
	Tue,  9 Feb 2021 19:46:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCD6810016F7;
	Tue,  9 Feb 2021 19:46:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2708C4E58E;
	Tue,  9 Feb 2021 19:46:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119JjwhR007557 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 14:45:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B5392166B27; Tue,  9 Feb 2021 19:45:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B312166B2B
	for <linux-cachefs@redhat.com>; Tue,  9 Feb 2021 19:45:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D5AA101A53A
	for <linux-cachefs@redhat.com>; Tue,  9 Feb 2021 19:45:55 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-447-RfyWT9VSOU6VA-Qo0zJO7Q-1; Tue, 09 Feb 2021 14:45:53 -0500
X-MC-Unique: RfyWT9VSOU6VA-Qo0zJO7Q-1
Received: by mail-qv1-f69.google.com with SMTP id h13so13975422qvo.18
	for <linux-cachefs@redhat.com>; Tue, 09 Feb 2021 11:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=07hMrz2JH7QjjSYxmQ6iVqH/nriv3v/7Q+e4rDzWnzs=;
	b=J8N0KKlhcWPTSlJBn4AzIPsYPhTlcdQ/OXr5vkqk1PzFi7nTPKew2H/j3KY7wGMfl3
	+ofbnhUV2jdqrvizZbmeOWViIApc+eFi6SztR9RBObFp0PSuiVySSa9dujwsacGlX2Xb
	3Hy+PyKxgKtIqHoS5OpyvIfLUyy5+u3NYmK+0bRvRbZn87q19TLGwJ7cyuNlKCQ1rIue
	12EXYfuRgYtVPFAnQOek10QY9QEmSh9XPBR8j45XbKEDAkQPW/Ruh0NTxLUKri1HM30E
	zoe1yT3DeIbftXk6BvYD4yIThaUjkTN6G0nuerapDPQX5NrKYwu2DUddOebsth3H2tL/
	or3Q==
X-Gm-Message-State: AOAM532IpPBaaG/ifHqn0wcVlzYbYfib7zGtt2OYgzYdifn/CYc3ftQ5
	Sb5PzitgzlfKuBT/oDs1kk5zQ528HDC71j8imkL/DkXVzUOBeiGITLFCMrkAKSG5XMNoN4u/AAs
	m/8HiBEqoQJCrf2aQ4b2EzA==
X-Received: by 2002:a37:4fcf:: with SMTP id
	d198mr23988256qkb.277.1612899953138; 
	Tue, 09 Feb 2021 11:45:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybD7SbuYQXGOXd3mMxVBLEZfaSpNELJGXVWAV5LvAAprhYnJ48OVnrJ8zBSJ4tAUenGug78w==
X-Received: by 2002:a37:4fcf:: with SMTP id
	d198mr23988232qkb.277.1612899952938; 
	Tue, 09 Feb 2021 11:45:52 -0800 (PST)
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
	by smtp.gmail.com with ESMTPSA id
	p16sm3234618qtq.24.2021.02.09.11.45.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 09 Feb 2021 11:45:52 -0800 (PST)
Message-ID: <c9d5464484dc7013eba9f49e88c19712c1276c31.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, David Howells
	<dhowells@redhat.com>
Date: Tue, 09 Feb 2021 14:45:51 -0500
In-Reply-To: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
References: <591237.1612886997@warthog.procyon.org.uk>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, Trond,
	Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Myklebust <trondmy@hammerspace.com>,
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-02-09 at 11:06 -0800, Linus Torvalds wrote:
> So I'm looking at this early, because I have more time now than I will
> have during the merge window, and honestly, your pull requests have
> been problematic in the past.
>=20
> The PG_fscache bit waiting functions are completely crazy. The comment
> about "this will wake up others" is actively wrong, and the waiting
> function looks insane, because you're mixing the two names for
> "fscache" which makes the code look totally incomprehensible. Why
> would we wait for PF_fscache, when PG_private_2 was set? Yes, I know
> why, but the code looks entirely nonsensical.
>=20
> So just looking at the support infrastructure changes, I get a big "Hmm".
>=20
> But the thing that makes me go "No, I won't pull this", is that it has
> all the same hallmark signs of trouble that I've complained about
> before: I see absolutely zero sign of "this has more developers
> involved".
>=20
> There's not a single ack from a VM person for the VM changes. There's
> no sign that this isn't yet another "David Howells went off alone and
> did something that absolutely nobody else cared about".
>=20
> See my problem? I need to be convinced that this makes sense outside
> of your world, and it's not yet another thing that will cause problems
> down the line because nobody else really ever used it or cared about
> it until we hit a snag.
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Linus
>=20

I (and several other developers) have been working with David on this
for the last year or so. Would it help if I gave this on the netfs lib
work and the fscache patches?

    Reviewed-and-tested-by: Jeff Layton <jlayton@redhat.com>

My testing has mainly been with ceph. My main interest is that this
allows us to drop a fairly significant chunk of rather nasty code from
fs/ceph. The netfs read helper infrastructure makes a _lot_ more sense
for a networked filesystem, IMO.

The legacy fscache code has some significant bugs too, and this gives it
a path to making better use of more modern kernel features. It should
also be set up so that filesystems can be converted piecemeal.

I'd really like to see this go in.

Cheers,
Jeff

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

