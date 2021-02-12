Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7080C31A2EB
	for <lists+linux-cachefs@lfdr.de>; Fri, 12 Feb 2021 17:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613148095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UQ40nCvf/QEtoYUj5nrVFUspWOp3ruAYQFwRVSYvjac=;
	b=JMjKpxDEc+prEj+St1Vtvucn2tgiKbxyN78O0myqQDVfCMc0HCLrliZUIodWKWSwe/sO2l
	5ZH2IQeuhGY6YIBsUX2YKLB8K3pbor4xVMQ8s50er2kzTfmwMi7wrcNmDG9GOJSetKRY9G
	Sw3l5r1kZr1L9lVXNdnrgPp6shD1b5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-e9I7lJr7NhuST88qp_YtWg-1; Fri, 12 Feb 2021 11:41:33 -0500
X-MC-Unique: e9I7lJr7NhuST88qp_YtWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D18F8710E0;
	Fri, 12 Feb 2021 16:41:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 824935D769;
	Fri, 12 Feb 2021 16:41:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6992A18095CB;
	Fri, 12 Feb 2021 16:41:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11CGfMNh001835 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 12 Feb 2021 11:41:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7A9AC2166B2D; Fri, 12 Feb 2021 16:41:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 758902166B28
	for <linux-cachefs@redhat.com>; Fri, 12 Feb 2021 16:41:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4A55811E87
	for <linux-cachefs@redhat.com>; Fri, 12 Feb 2021 16:41:17 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
	[209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-261-KJgW5oZ6NZ-9M3GfrFPe7w-1; Fri, 12 Feb 2021 11:41:16 -0500
X-MC-Unique: KJgW5oZ6NZ-9M3GfrFPe7w-1
Received: by mail-ej1-f69.google.com with SMTP id yd11so175935ejb.9
	for <linux-cachefs@redhat.com>; Fri, 12 Feb 2021 08:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ft1B0dmqfZyPUoyDvwnAfTze1mns3d3CFcFjBHQ5YEA=;
	b=la/ZYCveOhOTuiyaikp4WDJ+Xh6Pe6UybNAOh6g1AMO8FiO8e3k4RNE8EVNpWazlHi
	FJqMUUZGAr+2HTENl4ij+nauhlIjSJMnl+QUwSuc/39NMxkkGY+KkKa7/tDTJZP+KtbI
	+02WL8vms65kWwmV5C4MxrSvZWx1rcNKSPg4/I3aOGvJT8UvBmh/FS1O00/U5/T/yFxm
	Js/BfTB/5frK1V4VhvGHaGJJgCx/bUKu8t3NtLSOkEM1TAkQtQN/8VWWAmSXYMVKYGqf
	lxZKrOplAM0PMxHg6AgbsV61lDOVX0O3z/XC4qhJcVb7/z7VtWOlK7X5vB7P7qoMZwA+
	QuUw==
X-Gm-Message-State: AOAM530fF77oCHqHGnhsTsjwLFEqO2T0FdeRSY9YFRu93uUIueeeAxce
	qIMNei++cY9ei9M9YPHi/2QWGmGUUrSZlijzd3PIgKBTkcuFJLhnIb1v8BGxJa7Dtm4q6mRIILj
	NM+uxJCSBftAA+RWYRAGA0YQwVHtCK4rrTz/A6w==
X-Received: by 2002:a17:906:1681:: with SMTP id
	s1mr3897276ejd.229.1613148074940; 
	Fri, 12 Feb 2021 08:41:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTIgnx7LJiTFOW+mhqlshoZww0YFi52MiJxBqcnsY+RGcoAoY9xA8AY8Yu0JSD5ZHRlga8wGOKDsNd1QerD6Y=
X-Received: by 2002:a17:906:1681:: with SMTP id
	s1mr3897262ejd.229.1613148074745; 
	Fri, 12 Feb 2021 08:41:14 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
	<1330473.1612974547@warthog.procyon.org.uk>
	<1330751.1612974783@warthog.procyon.org.uk>
	<CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
	<27816.1613085646@warthog.procyon.org.uk>
In-Reply-To: <27816.1613085646@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 12 Feb 2021 11:40:38 -0500
Message-ID: <CALF+zOkRhZ6SfotHbWFMDYJ-qJxxOSMd8SUbrXd4w7rpOMoPKw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
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

On Thu, Feb 11, 2021 at 6:20 PM David Howells <dhowells@redhat.com> wrote:
>
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > Also, honestly, I really *REALLY* want your commit messages to talk
> > about who has been cc'd, who has been part of development, and point
> > to the PUBLIC MAILING LISTS WHERE THAT DISCUSSION WAS TAKING PLACE, so
> > that I can actually see that "yes, other people were involved"
>
> Most of the development discussion took place on IRC and waving snippets of
> code about in pastebin rather than email - the latency of email is just too
> high.  There's not a great deal I can do about that now as I haven't kept IRC
> logs.  I can do that in future if you want.
>
> > No, I don't require this in general, but exactly because of the
> > history we have, I really really want to see that. I want to see a
> >
> >    Link: https://lore.kernel.org/r/....
>
> I can add links to where I've posted the stuff for review.  Do you want this
> on a per-patch basis or just in the cover for now?
>
> Also, do you want things like these:
>
>  https://lore.kernel.org/linux-fsdevel/3326.1579019665@warthog.procyon.org.uk/
>  https://lore.kernel.org/linux-fsdevel/4467.1579020509@warthog.procyon.org.uk/
>
> which pertain to the overall fscache rewrite, but where the relevant changes
> didn't end up included in this particular patchset?  Or this:
>
>  https://listman.redhat.com/archives/linux-cachefs/2020-December/msg00000.html
>
> where someone was testing the overall patchset of which this is a subset?
>
> > and the Cc's - or better yet, the Reviewed-by's etc - so that when I
> > get a pull request, it really is very obvious to me when I look at it
> > that others really have been involved.
> >
> > So if I continue to see just
> >
> >     Signed-off-by: David Howells <dhowells@redhat.com>
> >
> > at the end of the commit messages, I will not pull.
> >
> > Yes, in this thread a couple of people have piped up and said that
> > they were part of the discussion and that they are interested, but if
> > I have to start asking around just to see that, then it's too little,
> > too late.
> >
> > No more of this "it looks like David Howells did things in private". I
> > want links I can follow to see the discussion, and I really want to
> > see that others really have been involved.
> >
> > Ok?
>
> Sure.
>
> I can go and edit in link pointers into the existing patches if you want and
> add Jeff's Review-and-tested-by into the appropriate ones.  You would be able
> to compare against the existing tag, so it wouldn't entirely invalidate the
> testing.
>
You can add my Tested-by for your fscache-next branch series ending at
commit  235299002012 netfs: Hold a ref on a page when PG_private_2 is set
This series includes your commit c723f0232c9f8928b3b15786499637bda3121f41
discussed a little earlier in this email thread.

I ran over 24 hours of NFS tests (unit, connectathon, xfstests,
various servers and all NFS versions) on your latest series
and it looks good.  Note I did not run against pNFS servers
due to known issue, and I did not do more advanced tests like
error injections.  I did get one OOM on xfstest generic/551 on
one testbed, but that same' test passed on another testbed,
so it's not clear what is happening there and it could very
well be testbed or NFS related.

In addition, I reviewed various patches in the series, especially the
API portions of the netfs patches, so for those, Reviewed-by is
appropriate as well. I have also reviewed some of the internals
of the other infrastructure patches, but my review is more limited
there.





> Also, do you want links inserting into all the patches of the two keyrings
> pull requests I've sent you?
>
> David
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

