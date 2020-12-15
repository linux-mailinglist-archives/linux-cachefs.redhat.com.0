Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 452F32DA562
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Dec 2020 02:13:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-Y4HVVeMFOD-jjllR7E0dyQ-1; Mon, 14 Dec 2020 20:12:56 -0500
X-MC-Unique: Y4HVVeMFOD-jjllR7E0dyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 366D4801AC3;
	Tue, 15 Dec 2020 01:12:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A77E760BE2;
	Tue, 15 Dec 2020 01:12:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38CAC18095FF;
	Tue, 15 Dec 2020 01:12:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BF1Cnjo021779 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 20:12:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4EA5990A00; Tue, 15 Dec 2020 01:12:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4985F906D6
	for <linux-cachefs@redhat.com>; Tue, 15 Dec 2020 01:12:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2194A185A794
	for <linux-cachefs@redhat.com>; Tue, 15 Dec 2020 01:12:47 +0000 (UTC)
Received: from mail106.syd.optusnet.com.au (mail106.syd.optusnet.com.au
	[211.29.132.42]) by relay.mimecast.com with ESMTP id
	us-mta-459-8YzjMq21PQmruHuR--XzHg-1; Mon, 14 Dec 2020 20:12:44 -0500
X-MC-Unique: 8YzjMq21PQmruHuR--XzHg-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail106.syd.optusnet.com.au (Postfix) with ESMTPS id 502E87668A5;
	Tue, 15 Dec 2020 12:12:41 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1koytM-0043LY-Pw; Tue, 15 Dec 2020 12:12:40 +1100
Date: Tue, 15 Dec 2020 12:12:40 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <20201215011240.GJ632069@dread.disaster.area>
References: <20201209131146.67289-1-laoar.shao@gmail.com>
	<20201209131146.67289-4-laoar.shao@gmail.com>
	<20201209195235.GN1943235@magnolia>
	<CALOAHbD_DK9w=s9RDsVBNaYwgeRi4UUEGDHFb3zEsqh_V8gLMA@mail.gmail.com>
	<20201214210833.GE632069@dread.disaster.area>
	<CALOAHbAK=OB1NQKwNYHttBuM=QZjc04cjU=YRw5MoTWT34HXvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALOAHbAK=OB1NQKwNYHttBuM=QZjc04cjU=YRw5MoTWT34HXvg@mail.gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=7-415B0cAAAA:8 a=yPCof4ZbAAAA:8
	a=U7ryOahPNW6b4qIbDJ8A:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 15, 2020 at 08:42:08AM +0800, Yafang Shao wrote:
> On Tue, Dec 15, 2020 at 5:08 AM Dave Chinner <david@fromorbit.com> wrote:
> > On Sun, Dec 13, 2020 at 05:09:02PM +0800, Yafang Shao wrote:
> > > On Thu, Dec 10, 2020 at 3:52 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
> > > > On Wed, Dec 09, 2020 at 09:11:45PM +0800, Yafang Shao wrote:
> > static inline void
> > xfs_trans_context_clear(struct xfs_trans *tp)
> > {
> >         /*
> >          * If xfs_trans_context_swap() handed the NOFS context to a
> >          * new transaction we do not clear the context here.
> >          */
> >         if (current->journal_info != tp)
> 
> current->journal_info hasn't been used in patch #3, that will make
> patch #3 a little more complex.
> We have to do some workaround in patch #3. I will think about it.

What I wrote is how the function should look at the end of the patch
series.  Do not add the current->journal_info parts of it until the
patch that introduces the current->journal_info tracking.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

