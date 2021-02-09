Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E84FC315997
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Feb 2021 23:42:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612910577;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w8j6RQlbM+fxGjcT+Usuy64/wLQK+lE9HXmUiHJ8C48=;
	b=GYN2lcMqG6j3VoETOCc9n+XT9C3EMD82gCcIQKj/KN78N8Rc+WBQYHh6jUJc98o1oVCiWF
	eIucb4+H/Zoctgi8LhtYuhHKom5jGh7ctCpbFreEGQIvftaQLdVtfHvWHCQ1WXmoexh2LL
	RGZAxuIEczr26brcYZqWJh3lpf7LRKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-KsdtAQV4OACI_4j39f3r3Q-1; Tue, 09 Feb 2021 17:42:55 -0500
X-MC-Unique: KsdtAQV4OACI_4j39f3r3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 548DC107ACC7;
	Tue,  9 Feb 2021 22:42:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 117785D736;
	Tue,  9 Feb 2021 22:42:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34D1A18095CB;
	Tue,  9 Feb 2021 22:42:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119MgjR0029728 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 17:42:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82159A9F1C; Tue,  9 Feb 2021 22:42:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C83DA9F1E
	for <linux-cachefs@redhat.com>; Tue,  9 Feb 2021 22:42:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689BD185A78E
	for <linux-cachefs@redhat.com>; Tue,  9 Feb 2021 22:42:43 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-52-wkBhxncIMHmNrp68QFRdfA-1; Tue, 09 Feb 2021 17:42:41 -0500
X-MC-Unique: wkBhxncIMHmNrp68QFRdfA-1
Received: by mail-ed1-f70.google.com with SMTP id w14so127237edv.6
	for <linux-cachefs@redhat.com>; Tue, 09 Feb 2021 14:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GZ7uCNlA2uIi2Zywr96bupyWhGmv/tkzQj/R8fIDK/I=;
	b=X+nXUhYQ96YXkGTll211Hy9pQEta1/kWgINdTMl0iYU92yL1G48kKu/qhgyMbPhL8a
	Lpzfhe8fUgx2eRsMu6y3VHNood+a5JA7D7Qt/0R2xKSPoh7g85M+THAgVjco0o+49o1E
	qLrlXtot7TX0x/vUCtdSI00C9wCOFrhwmHTP+/3mxEEGxA3/q0FsFPzzs0hLPflz7DS+
	M/f5xF8s8gseZy2Ez5xJ9Gq5nSeEeDkN3MH63maE8Vj68d9AH+CvlrIASlj1pwidW82o
	ziyHRRwWC64uVEiqJMsZbL6rDiqSyJhfZPgFJOE8KDTT54CpzjOZ39KG1d5y1Rb5vypo
	2iWQ==
X-Gm-Message-State: AOAM5332o9EMO0Su8JE8Lvnto4cLaCYUVxK+/qrWbXa9GFI8xBlXY199
	DsMIkDRkuRGgnERZNPbWUY5ulT/sYwtLJNeKAxdlIy7fFY7S7FGOg1aQ9lMimK7G4Pv0onYHvsw
	kliE1DN/Yv5yz+KFnY9JpsF8wD+qM9SBXy3my2A==
X-Received: by 2002:a17:906:b351:: with SMTP id
	cd17mr24871300ejb.110.1612910560580; 
	Tue, 09 Feb 2021 14:42:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWZ/SxMb2EYr3Wx/r9tLm+ytvzx5rNbM3Mu7nYLvi+QXirS/jRZBjDCWHtM3Wa2pEsJ4PdxjPocMuO52GFZ9o=
X-Received: by 2002:a17:906:b351:: with SMTP id
	cd17mr24871281ejb.110.1612910560352; 
	Tue, 09 Feb 2021 14:42:40 -0800 (PST)
MIME-Version: 1.0
References: <591237.1612886997@warthog.procyon.org.uk>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
In-Reply-To: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 9 Feb 2021 17:42:04 -0500
Message-ID: <CALF+zOkMKqvidLf8WZD889PUN-KofdiRPOcbO4hxboVmUGiOgw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	linux-cachefs <linux-cachefs@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 9, 2021 at 2:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So I'm looking at this early, because I have more time now than I will
> have during the merge window, and honestly, your pull requests have
> been problematic in the past.
>
> The PG_fscache bit waiting functions are completely crazy. The comment
> about "this will wake up others" is actively wrong, and the waiting
> function looks insane, because you're mixing the two names for
> "fscache" which makes the code look totally incomprehensible. Why
> would we wait for PF_fscache, when PG_private_2 was set? Yes, I know
> why, but the code looks entirely nonsensical.
>
> So just looking at the support infrastructure changes, I get a big "Hmm".
>
> But the thing that makes me go "No, I won't pull this", is that it has
> all the same hallmark signs of trouble that I've complained about
> before: I see absolutely zero sign of "this has more developers
> involved".
>
> There's not a single ack from a VM person for the VM changes. There's
> no sign that this isn't yet another "David Howells went off alone and
> did something that absolutely nobody else cared about".
>

I care about it.

I cannot speak to your concerns about the infrastructure changes, nor
can I comment about a given maintainers involvement or lack thereof.
However, I can tell you what my involvement has been.  I got involved
with it because some of our customers use fscache with NFS and I've
supported it.  I saw dhowells rewriting it to greatly simplify the
code and make it easier to debug and wanted to support the effort.

I have been working on the NFS conversion as dhowells has been
evolving the fscache-iter API.  David first posted the series I think
in Dec 2019 and I started with NFS about mid-year 2020, and had my
first post of NFS patches in July:
https://marc.info/?l=linux-nfs&m=159482591232752&w=2

One thing that came out of the earlier iterations as a result of my
testing was the need for the network filesystem to be able to 'cap'
the IO size based on its parameters, hence the "clamp_length()"
function.  So the next iteration dhowells further evolved it into a
'netfs' API and a 'fscache' API, and my November post was based on
that:
https://marc.info/?l=linux-nfs&m=160596540022461&w=2

Each iteration has greatly simplified the interface to the network
filesystem until today where the API is pretty simple.  I have done
extensive tests with each iteration with all the main NFS versions,
specific unit tests, xfstests, etc.  However my test matrix did not
hit enough fscache + pNFS servers, and I found a problem too late to
include in his pull request.  This is mostly why my patches were not
included to convert NFS to the new fscache API, but I intend to work
out the remaining issues for the next merge window, and I'll have an
opportunity to do more testing last week of Feb with the NFS "remote
bakeathon".  My most recent post was at the end of Jan, and Anna is
taking the first 5 refactoring patches in the next merge window:
https://marc.info/?l=linux-nfs&m=161184595127618&w=2

I do not have the skills of a Trond or Anna NFS developers, but I have
worked in this in earnest and intend to see it through to completion
and support NFS and fscache work.  I have received some feedback on
the NFS patches though it's not been a lot, I do know I have some
things to address still.  With open source, no feedback is hard to
draw conclusions other than it's not "super popular" area, but we
always knew that about fscache - it's an "add on" that some customers
require but not everyone. I know Trond speaks up when I make a mistake
and/or something will cause a problem, so I consider the silence
mostly a positive sign.



> See my problem? I need to be convinced that this makes sense outside
> of your world, and it's not yet another thing that will cause problems
> down the line because nobody else really ever used it or cared about
> it until we hit a snag.
>
>                   Linus
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

