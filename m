Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 45275388E98
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 May 2021 15:04:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-IjvoBAVHNiWf2LqjD-UL1g-1; Wed, 19 May 2021 09:03:12 -0400
X-MC-Unique: IjvoBAVHNiWf2LqjD-UL1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D0141009446;
	Wed, 19 May 2021 13:03:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74F5A5C3FD;
	Wed, 19 May 2021 13:03:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8AB61800FFC;
	Wed, 19 May 2021 13:03:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14JCvsZI005142 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 May 2021 08:57:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3824112CA05; Wed, 19 May 2021 12:57:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF300112CA01
	for <linux-cachefs@redhat.com>; Wed, 19 May 2021 12:57:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E7FA80D0E0
	for <linux-cachefs@redhat.com>; Wed, 19 May 2021 12:57:52 +0000 (UTC)
Received: from mail106.syd.optusnet.com.au (mail106.syd.optusnet.com.au
	[211.29.132.42]) by relay.mimecast.com with ESMTP id
	us-mta-463-cVOAt0edPWuC9W70R3gMjA-1; Wed, 19 May 2021 08:57:47 -0400
X-MC-Unique: cVOAt0edPWuC9W70R3gMjA-1
Received: from dread.disaster.area (pa49-195-118-180.pa.nsw.optusnet.com.au
	[49.195.118.180])
	by mail106.syd.optusnet.com.au (Postfix) with ESMTPS id 7F83080BA7C;
	Wed, 19 May 2021 22:57:44 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1ljLlf-002mpn-8h; Wed, 19 May 2021 22:57:43 +1000
Date: Wed, 19 May 2021 22:57:43 +1000
From: Dave Chinner <david@fromorbit.com>
To: Avi Kivity <avi@scylladb.com>
Message-ID: <20210519125743.GP2893@dread.disaster.area>
References: <206078.1621264018@warthog.procyon.org.uk>
	<20210517232237.GE2893@dread.disaster.area>
	<ad2e8757-41ce-41e3-a22e-0cf9e356e656@scylladb.com>
MIME-Version: 1.0
In-Reply-To: <ad2e8757-41ce-41e3-a22e-0cf9e356e656@scylladb.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Tu+Yewfh c=1 sm=1 tr=0
	a=xcwBwyABtj18PbVNKPPJDQ==:117 a=xcwBwyABtj18PbVNKPPJDQ==:17
	a=kj9zAlcOel0A:10 a=5FLXtPjwQuUA:10 a=7-415B0cAAAA:8
	a=JUdNrTaQNZjwa7RRXdQA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
	linux-cachefs@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
 xfs and btrfs directories?
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 11:00:03AM +0300, Avi Kivity wrote:
> 
> On 18/05/2021 02.22, Dave Chinner wrote:
> > 
> > > What I'd like to do is remove the fanout directories, so that for each logical
> > > "volume"[*] I have a single directory with all the files in it.  But that
> > > means sticking massive amounts of entries into a single directory and hoping
> > > it (a) isn't too slow and (b) doesn't hit the capacity limit.
> > Note that if you use a single directory, you are effectively single
> > threading modifications to your file index. You still need to use
> > fanout directories if you want concurrency during modification for
> > the cachefiles index, but that's a different design criteria
> > compared to directory capacity and modification/lookup scalability.
> 
> Something that hit us with single-large-directory and XFS is that
> XFS will allocate all files in a directory using the same
> allocation group.  If your entire filesystem is just for that one
> directory, then that allocation group will be contended.

There is more than one concurrency problem that can arise from using
single large directories. Allocation policy is just another aspect
of the concurrency picture.

Indeed, you can avoid this specific problem simply by using the
inode32 allocator - this policy round-robins files across allocation
groups instead of trying to keep files physically local to their
parent directory. Hence if you just want one big directory with lots
of files that index lots of data, using the inode32 allocator will
allow the files in the filesytsem to allocate/free space at maximum
concurrency at all times...

> We saw spurious ENOSPC when that happened, though that
> may have related to bad O_DIRECT management by us.

You should not see spurious ENOSPC at all.

The only time I've recall this sort of thing occurring is when large
extent size hints are abused by applying them to every single file
and allocation regardless of whether they are needed, whilst
simultaneously mixing long term and short term data in the same
physical locality. Over time the repeated removal and reallocation
of short term data amongst long term data fragments the crap out of
free space until there are no large contiguous free spaces left to
allocate contiguous extents from.

> We ended up creating files in a temporary directory and moving them to the
> main directory, since for us the directory layout was mandated by
> compatibility concerns.

inode32 would have done effectively the same thing but without
needing to change the application....

> We are now happy with XFS large-directory management, but are nowhere close
> to a million files.

I think you are conflating directory scalability with problems
arising from file allocation policies not being ideal for your data
set organisation, layout and longevity characteristics.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

