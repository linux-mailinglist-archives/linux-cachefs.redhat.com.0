Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 62A042D213C
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Dec 2020 04:04:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-RI2NA6SGOdS7Pj3gcBl2bA-1; Mon, 07 Dec 2020 22:04:21 -0500
X-MC-Unique: RI2NA6SGOdS7Pj3gcBl2bA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24D89858181;
	Tue,  8 Dec 2020 03:04:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA35A3A3;
	Tue,  8 Dec 2020 03:04:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38DA1180954D;
	Tue,  8 Dec 2020 03:04:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B834F2B021551 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 22:04:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A10DB2166B2B; Tue,  8 Dec 2020 03:04:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BA162166B27
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 03:04:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3370A800140
	for <linux-cachefs@redhat.com>; Tue,  8 Dec 2020 03:04:13 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-104-aX5YDCpaNUepUdkNfjj90Q-1; Mon, 07 Dec 2020 22:04:07 -0500
X-MC-Unique: aX5YDCpaNUepUdkNfjj90Q-1
Received: by mail-il1-f193.google.com with SMTP id q1so14260037ilt.6;
	Mon, 07 Dec 2020 19:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fqV+RZduulUj6NbGqyUOp9hoM7sI3vwmhR3qosb54tw=;
	b=rpEeu9aFHV6EVQl5h4Xyvib95dytZXGyk5cXrBHNcnHwuvcJWVqDyfvxyeaCySIhrc
	jp/xUwygGfJEEPqhxZdyUBxevW30dQPzsuHZh8pXD1pebmAmwqkAwh353E7dyTrrpjt3
	hPMocnUtfmkAUbgLtI7qi7kzPzhhowX879d5FoMhdCQ7mtEz2OZDZtOfgWvB/K/ituR7
	BkZ1ky9/vVdkzpo5s9N2WSnQjChMNmt7PWqFR0PL3hiq7BKaDGa8Ut5mlUezKc7Xw0JG
	68ye2vnWu9GypRMXKDRTrLqLg/pDQ/zCaPMyu7C9SpfigBnNbTU4ck83ZiYGvG1KzBpp
	saDQ==
X-Gm-Message-State: AOAM530OWryampf+yONQFEIXsIUSeCv+ivax4EKy/+stt84EcgubmEEF
	ASfkLXhXIUlr7HAxOOhZ3utUeEnvioVfkJfS5eZjoVePNtcJsw==
X-Google-Smtp-Source: ABdhPJzYL1yRHIfcv/yWDBMbtYSBYQ5IsNwznZbZh4rfJfdR29NH+nqOy74D8K+MjJGY5+ETdEjkP/+n+puhVHGd8Do=
X-Received: by 2002:a92:ae10:: with SMTP id s16mr25678688ilh.142.1607396647025;
	Mon, 07 Dec 2020 19:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20201208021543.76501-1-laoar.shao@gmail.com>
	<20201208021543.76501-5-laoar.shao@gmail.com>
	<20201208024158.GF7338@casper.infradead.org>
In-Reply-To: <20201208024158.GF7338@casper.infradead.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 8 Dec 2020 11:03:31 +0800
Message-ID: <CALOAHbCS9Np3KPh9O4TgCUCynG3yw0+z2Q9KBANE7KVS9ecazA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
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
	Dave Chinner <david@fromorbit.com>, Michal Hocko <mhocko@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v10 4/4] xfs: use current->journal_info
 to avoid transaction reservation recursion
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 8, 2020 at 10:42 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Dec 08, 2020 at 10:15:43AM +0800, Yafang Shao wrote:
> > -     /*
> > -      * Given that we do not allow direct reclaim to call us, we should
> > -      * never be called in a recursive filesystem reclaim context.
> > -      */
> > -     if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
> > -             goto redirty;
> > -
> >       /*
> >        * Is this page beyond the end of the file?
> >        *
> > diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> > index 2371187b7615..28db93d0da97 100644
> > --- a/fs/xfs/xfs_aops.c
> > +++ b/fs/xfs/xfs_aops.c
> > @@ -568,6 +568,16 @@ xfs_vm_writepage(
> >  {
> >       struct xfs_writepage_ctx wpc = { };
> >
> > +     /*
> > +      * Given that we do not allow direct reclaim to call us, we should
> > +      * never be called while in a filesystem transaction.
> > +      */
> > +     if (xfs_trans_context_active()) {
> > +             redirty_page_for_writepage(wbc, page);
> > +             unlock_page(page);
> > +             return 0;
> > +     }
>
> Dave specifically asked for this one to WARN too.

I put the warn in xfs_trans_context_active(), pls. see the definition of it.
Is that okay ?

-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

