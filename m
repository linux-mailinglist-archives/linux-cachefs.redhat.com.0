Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6DF2DA729
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Dec 2020 05:40:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-iqowfVA6NWCiURLZA2elCA-1; Mon, 14 Dec 2020 23:40:00 -0500
X-MC-Unique: iqowfVA6NWCiURLZA2elCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7E3D10054FF;
	Tue, 15 Dec 2020 04:39:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2DEA60C15;
	Tue, 15 Dec 2020 04:39:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E2E0180954D;
	Tue, 15 Dec 2020 04:39:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BF4dn7v009148 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 23:39:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0E5FE2166B2B; Tue, 15 Dec 2020 04:39:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08CFF2166B27
	for <linux-cachefs@redhat.com>; Tue, 15 Dec 2020 04:39:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E5AA186E121
	for <linux-cachefs@redhat.com>; Tue, 15 Dec 2020 04:39:46 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-215-4W9RGyfAMN-UCNYeQ32Sug-1; Mon, 14 Dec 2020 23:39:41 -0500
X-MC-Unique: 4W9RGyfAMN-UCNYeQ32Sug-1
Received: by mail-io1-f65.google.com with SMTP id z5so19195075iob.11;
	Mon, 14 Dec 2020 20:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eZpMSPWj4XpZ3thlAzvu56DgfsvqpomnX3VopvGqVOs=;
	b=K9xNCBkyvHrL+wYJc5TJAZyAa7JFnsciMO81IUav4c8HYvX0VKrcqToj89xpLbv+er
	Z1oo/Ot7uqgZ/+cwMNNqupoRUZwNULYB/hmn4YySP9iq/kt0a2EYacPUTWdFqxBmfeio
	allqfoDKDnyTSM0pvgaIkoqoqb/0c4Sr0J8TEH7TOEzKm3RQlGQO1/9JU1sbCq/pNJJY
	ikKaM6iUcwkK+ACqyRNRnNCf4SQWSSQU9plCvJLH3XfEPY3Ufo0E0tb6Xkep+aSwI9DF
	RQLDvRDxDkNy42SXAnCKSv6zoL9SaH1UqCO+WuT3BafIU2LaIlEgiEXLZ7gd+WUSTOZf
	hQbg==
X-Gm-Message-State: AOAM530lbqTcpOvm5pg+TBvFAXO1VVVKXeEufsm5AwSB6KOMI7VQFY55
	Eh42Nyy/3jbWySK1W25LDPlLhlHyMSVEvd2pMRQ=
X-Google-Smtp-Source: ABdhPJz5tqAgMHotC0ERTj7zEoC52sQPoOS/rmGpHPpLK7dh8dJAOI6n+d/eAqkIo1EpDGfAFFhkyGH6jgFwEVtRovM=
X-Received: by 2002:a02:a152:: with SMTP id m18mr37230897jah.64.1608007180900; 
	Mon, 14 Dec 2020 20:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20201209131146.67289-1-laoar.shao@gmail.com>
	<20201209131146.67289-4-laoar.shao@gmail.com>
	<20201209195235.GN1943235@magnolia>
	<CALOAHbD_DK9w=s9RDsVBNaYwgeRi4UUEGDHFb3zEsqh_V8gLMA@mail.gmail.com>
	<20201214210833.GE632069@dread.disaster.area>
	<CALOAHbAK=OB1NQKwNYHttBuM=QZjc04cjU=YRw5MoTWT34HXvg@mail.gmail.com>
	<20201215011240.GJ632069@dread.disaster.area>
In-Reply-To: <20201215011240.GJ632069@dread.disaster.area>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 15 Dec 2020 12:39:05 +0800
Message-ID: <CALOAHbDU1OUaMxV9fz3AP6t0OWp=o8X6bQnw0zdo5HiTmrOZBA@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
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
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v12 3/4] xfs: refactor the usage around
	xfs_trans_context_{set, clear}
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

On Tue, Dec 15, 2020 at 9:12 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Tue, Dec 15, 2020 at 08:42:08AM +0800, Yafang Shao wrote:
> > On Tue, Dec 15, 2020 at 5:08 AM Dave Chinner <david@fromorbit.com> wrote:
> > > On Sun, Dec 13, 2020 at 05:09:02PM +0800, Yafang Shao wrote:
> > > > On Thu, Dec 10, 2020 at 3:52 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
> > > > > On Wed, Dec 09, 2020 at 09:11:45PM +0800, Yafang Shao wrote:
> > > static inline void
> > > xfs_trans_context_clear(struct xfs_trans *tp)
> > > {
> > >         /*
> > >          * If xfs_trans_context_swap() handed the NOFS context to a
> > >          * new transaction we do not clear the context here.
> > >          */
> > >         if (current->journal_info != tp)
> >
> > current->journal_info hasn't been used in patch #3, that will make
> > patch #3 a little more complex.
> > We have to do some workaround in patch #3. I will think about it.
>
> What I wrote is how the function should look at the end of the patch
> series.  Do not add the current->journal_info parts of it until the
> patch that introduces the current->journal_info tracking.
>

I know what you meant.
While I mean we have to do some hack, as suggested by Darrrick that
"set NOFS in the old transaction's
t_pflags so that when we clear the context on the old transaction we
don't actually change the thread's NOFS state." in patch #3 and then
remove it in patch #4.


-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

