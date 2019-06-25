Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0664455183
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 Jun 2019 16:22:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C166307CB52;
	Tue, 25 Jun 2019 14:21:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 139615D71B;
	Tue, 25 Jun 2019 14:21:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4938206D4;
	Tue, 25 Jun 2019 14:21:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PCCdWi013680 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 08:12:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8A29600D1; Tue, 25 Jun 2019 12:12:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4043600CD
	for <linux-cachefs@redhat.com>; Tue, 25 Jun 2019 12:12:34 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DB3580F81
	for <linux-cachefs@redhat.com>; Tue, 25 Jun 2019 12:12:34 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id m16so7359909otq.13
	for <linux-cachefs@redhat.com>; Tue, 25 Jun 2019 05:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xtX13vSVbmx57mGL/Q0hXK8kpnRo7HFPa5oOdLxipaM=;
	b=rLMFk0bLG1FibaI6nxyVHU3ztN5apxJd49DRLMWVLMHYzc1K1Y9PXgHoa4EIl3Cum/
	vEhoFIF43o7MyJWd4382Q1pvNvrkeq57L0C4Dh29D4gbEBe0qFpaBxAL6RuNTOKQVdB4
	Z9XqpeZuW4dLFrP/4qJjw+6xDmvh2U8KQmUCNCo6dgoe0vdKPtx3mtyVVD3JD9YHiXB+
	Rh8jvJjpppAiwhDVUurIop7prGot8ZLXRHooaMyGUXL74hs/ArnrZT6bnK5gogXalww5
	yuWowAQT99MC086mN0sQAPON7Rb/l5iA1L5SFYVoUnQyrd0bRL+4zZJlfh3OKv4j5Pda
	4KMg==
X-Gm-Message-State: APjAAAXP9aVv/3Aa8dvgtAXnzlrtzPtpGCzyYRCMKlNM5XzHO8mwYxEG
	/69mpCGnNMzYB7N255wCa44yLts1Kmja9IK5QvQo0x1cbYUd/hll8eRCkKuJ3jJ/D78cFuwzdk6
	hm553hhJpyTdRMHdRNb6GcE+Pd05yATunO7H6Ew==
X-Received: by 2002:aca:b58b:: with SMTP id
	e133mr14183015oif.147.1561464753901; 
	Tue, 25 Jun 2019 05:12:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIF0shhnL3kTWbxYnFTIfJoQ9NWdzzlYJbdr7wT1RELz57W5jZU6ihqAiJYZbsgta0nM0Q5SDLuZyhNwwIoP0=
X-Received: by 2002:aca:b58b:: with SMTP id
	e133mr14182998oif.147.1561464753642; 
	Tue, 25 Jun 2019 05:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
	<CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
	<20190625103430.GW3402@hirez.programming.kicks-ass.net>
In-Reply-To: <20190625103430.GW3402@hirez.programming.kicks-ass.net>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 25 Jun 2019 14:12:22 +0200
Message-ID: <CAHc6FU6zUCdQZ1AfN2KYcPYVKc5bwvc0bD7=-KZpFXws+F9QZQ@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 25 Jun 2019 10:21:03 -0400
Cc: Martin Brandenburg <martin@omnibond.com>, linux-cachefs@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, linux-aio@kvack.org,
	David Airlie <airlied@linux.ie>,
	samba-technical <samba-technical@lists.samba.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Will Deacon <will.deacon@arm.com>,
	dri-devel@lists.freedesktop.org, Chris Mason <clm@fb.com>,
	dm-devel@redhat.com, keyrings@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, linux-afs@lists.infradead.org,
	Alasdair Kergon <agk@redhat.com>,
	Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	James Morris <jmorris@namei.org>, cluster-devel <cluster-devel@redhat.com>,
	Antti Palosaari <crope@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>,
	Paul McKenney <paulmck@linux.vnet.ibm.com>,
	intel-gfx@lists.freedesktop.org, devel@lists.orangefs.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mediatek@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
	MauroCarvalho Chehab <mchehab@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-arm-kernel@lists.infradead.org,
	"J. Bruce Fields" <bfields@fieldses.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	netdev@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>, Steve French <sfrench@samba.org>,
	linux-bluetooth@vger.kernel.org,
	LSM <linux-security-module@vger.kernel.org>,
	Benjamin LaHaise <bcrl@kvack.org>, Daniel Vetter <daniel@ffwll.ch>,
	Bob Peterson <rpeterso@redhat.com>, linux-media@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC][PATCH] wake_up_var() memory ordering
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 25 Jun 2019 14:22:17 +0000 (UTC)

On Tue, 25 Jun 2019 at 12:36, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Jun 25, 2019 at 11:19:35AM +0200, Andreas Gruenbacher wrote:
> > > diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> > > index cf4c767005b1..666629ea5da7 100644
> > > --- a/fs/gfs2/glops.c
> > > +++ b/fs/gfs2/glops.c
> > > @@ -227,6 +227,7 @@ static void gfs2_clear_glop_pending(struct gfs2_inode *ip)
> > >                 return;
> > >
> > >         clear_bit_unlock(GIF_GLOP_PENDING, &ip->i_flags);
> > > +       smp_mb__after_atomic();
> > >         wake_up_bit(&ip->i_flags, GIF_GLOP_PENDING);
> >
> > This should become clear_and_wake_up_bit as well, right? There are
> > several more instances of the same pattern.
>
> Only if we do as David suggested and make clean_and_wake_up_bit()
> provide the RELEASE barrier.

(It's clear_and_wake_up_bit, not clean_and_wake_up_bit.)

> That is, currently clear_and_wake_up_bit() is
>
>         clear_bit()
>         smp_mb__after_atomic();
>         wake_up_bit();
>
> But the above is:
>
>         clear_bit_unlock();
>         smp_mb__after_atomic();
>         wake_up_bit()
>
> the difference is that _unlock() uses RELEASE semantics, where
> clear_bit() does not.
>
> The difference is illustrated with something like:
>
>         cond = true;
>         clear_bit()
>         smp_mb__after_atomic();
>         wake_up_bit();
>
> In this case, a remote CPU can first observe the clear_bit() and then
> the 'cond = true' store. When we use clear_bit_unlock() this is not
> possible, because the RELEASE barrier ensures that everything before,
> stays before.

Now I'm confused because clear_and_wake_up_bit() in mainline does use
clear_bit_unlock(), so it's the exact opposite of what you just said.

Thanks,
Andreas

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
