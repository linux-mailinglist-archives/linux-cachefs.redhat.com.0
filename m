Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 912D531B3D0
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 Feb 2021 02:02:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-n12hgMDFMUejHpy0AHrjSA-1; Sun, 14 Feb 2021 20:02:09 -0500
X-MC-Unique: n12hgMDFMUejHpy0AHrjSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA96C280;
	Mon, 15 Feb 2021 01:02:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B80860C04;
	Mon, 15 Feb 2021 01:02:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0735918095CB;
	Mon, 15 Feb 2021 01:02:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11F121c3008796 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 14 Feb 2021 20:02:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C9A22166B28; Mon, 15 Feb 2021 01:02:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 789E32166B32
	for <linux-cachefs@redhat.com>; Mon, 15 Feb 2021 01:01:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F9B7101A53A
	for <linux-cachefs@redhat.com>; Mon, 15 Feb 2021 01:01:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-555-QhIJJFL-PEa9LjYNl3AOLA-1; Sun, 14 Feb 2021 20:01:56 -0500
X-MC-Unique: QhIJJFL-PEa9LjYNl3AOLA-1
Received: by mail-lf1-f52.google.com with SMTP id v24so7798238lfr.7
	for <linux-cachefs@redhat.com>; Sun, 14 Feb 2021 17:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8oLEqXUvdqy1QH/cRggvF58640ngzAUjBT8Tfk3Wjwg=;
	b=cvhfgCh73Tgb2M2mb7Gab/GwCyS2H3MRpgde3O+cl7X01FxaHif1bMhkRCZJdlkpFt
	hscgn4EG1yInfp8FgRrfu2/JgF96+3rBS2Us62+qtmdg2rQHIUa2giE+dGfjSZ4fBX1v
	SgZqrbCebbIFup3p37JybXzknBDqkgRxu3d4JVv5IS22561OExmRz0akeTSwrO57/0uy
	hC5Dc6bXD628GNwmQHVArZnk3n5SYYK+Ny7y5Hcr7qUzeljZ8BFit8z8p9FZY1fIL+s0
	8zHVSUFSERlLPg8jcAmOb/bxvLgWNJZl5McLmpY8xWm/Oh8FSYxthSqCRkhE2FzmnCg0
	/tmQ==
X-Gm-Message-State: AOAM530qYiLYHJcUWSbE/dNuPOfb+933Pl4JiT3IC3kKBlsmrBIDaXXd
	G6Ni46hVe1CagALVn2ncouifKa8PLXi14A==
X-Google-Smtp-Source: ABdhPJy1ehkJphnGiArMPLianvDXXaBSy+fKfyjGe+zEKVW9wQUPPqXxrJItypKzkbahCufugg5XOQ==
X-Received: by 2002:a05:6512:22c8:: with SMTP id
	g8mr7279577lfu.388.1613350914141; 
	Sun, 14 Feb 2021 17:01:54 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
	[209.85.208.174]) by smtp.gmail.com with ESMTPSA id
	e16sm3293718ljn.105.2021.02.14.17.01.52
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 14 Feb 2021 17:01:52 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id r23so5943213ljh.1
	for <linux-cachefs@redhat.com>; Sun, 14 Feb 2021 17:01:52 -0800 (PST)
X-Received: by 2002:a05:651c:112:: with SMTP id
	a18mr8181174ljb.465.1613350911576; 
	Sun, 14 Feb 2021 17:01:51 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
	<1330473.1612974547@warthog.procyon.org.uk>
	<1330751.1612974783@warthog.procyon.org.uk>
	<CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
	<27816.1613085646@warthog.procyon.org.uk>
	<CAHk-=wi68OpbwBm6RCodhNUyg6x8N7vi5ufjRtosQSPy_EYqLA@mail.gmail.com>
	<860729.1613348577@warthog.procyon.org.uk>
In-Reply-To: <860729.1613348577@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Feb 2021 17:01:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh7xY3UF7zEc0BNVNjOox59jYBW-Gfi7=emm+BXPWc6nQ@mail.gmail.com>
Message-ID: <CAHk-=wh7xY3UF7zEc0BNVNjOox59jYBW-Gfi7=emm+BXPWc6nQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 14, 2021 at 4:23 PM David Howells <dhowells@redhat.com> wrote:
>
> Anyway, I have posted my fscache modernisation patches multiple times for
> public review, I have tried to involve the wider community in aspects of the
> development on public mailing lists and I have been including the maintainers
> in to/cc.

So then add those links and the cc's to the commit logs, so that I can
*see* them.

I'm done with this discussion.

If I see a pull request from you, I DO NOT WANT TO HAVE TO HAVE A
WEEK-LONG EMAIL THREAD ABOUT HOW I CANNOT SEE THAT IT HAS EVER SEEN
ANY REVIEW.

So if all I see is "Signed-off-by:" from you, I will promptly throw
that pull request into the garbage, because it's just not worth my
time to try to have to get you kicking and screaming to show that
others have been involved.

Can you not understand that?

When I get that pull request, I need to see that yes, this has been
reviewed, people have been involved, and yes, it's been in linux-next.

I want to see "reviewed-by" and "tested-by", I want to see "cc", and I
want to see links to submission threads with discussion showing that
others actually were involved.

I do *not* want to see just a single signed-off-by line from you, and
then have to ask for "has anybody else actually seen this and reviewed
it".

Look, here's an entirely unrelated example from a single fairly recent
trivial one-liner memory leak fix:

    Fixes: 87c715dcde63 ("scsi: scsi_debug: Add per_host_store option")
    Link: https://lore.kernel.org/r/20210208111734.34034-1-mlombard@redhat.com
    Acked-by: Douglas Gilbert <dgilbert@interlog.com>
    Signed-off-by: Maurizio Lombardi <mlombard@redhat.com>
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

that's from a quite a trivial commit. Yes, it's trivial, but it could
still be wrong, of course. And if somebody ever reports that it causes
problems despite how simple it was, look at what I have: I have three
people to contact, and I have a pointer to the actual original
submission of the patch.

Do we have that for all our commits? No. But it's also not at all
unusual any more, and in fact many commits have even more, with
testing etc.

And yes, sometimes the test results and acks come back later after
you've already pushed the changes out etc, and no, it's generally not
worth rebasing for that - maybe others have now started to rely on
whatever public branch you have. Which is why the "Link:" is useful,
so that if things come in later, the discussion can still be found.
But quite often, you shouldn't have pushed out some final branch
before you've gotten at least *some* positive response from people, so
I do kind of expect some "Acked-by" etc in the commit itself.

THAT is what you need to aim for.

And yes, I'm picking on you. Because we've had this problem before.
I've complained when you've sent me pull requests that don't even
build, that you in fact had been told by linux-next didn't build, and
you still sent them to me.

And as a result, I've asked for more involvement from other people before.

So now I'm clarifying that requirement - I  absolutely need to see
that it has actually seen testing, that it has seen other people being
involved, and that it isn't just you throwing spaghetti at the wall to
see what sticks.

And I'm not going to do that for every pull request. I want to see
that data *in* the pull request itself.

            Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

