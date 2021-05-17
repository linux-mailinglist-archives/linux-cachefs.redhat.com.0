Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE89386DEE
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 May 2021 01:53:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-B_DWiIx2P4OEI8taqMIIaw-1; Mon, 17 May 2021 19:53:15 -0400
X-MC-Unique: B_DWiIx2P4OEI8taqMIIaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBE1551F4;
	Mon, 17 May 2021 23:53:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C2359453;
	Mon, 17 May 2021 23:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91DCA1800BB0;
	Mon, 17 May 2021 23:53:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14HNr8OC009774 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 May 2021 19:53:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED31A112CA0C; Mon, 17 May 2021 23:53:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7418112CA0F
	for <linux-cachefs@redhat.com>; Mon, 17 May 2021 23:53:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73E95833942
	for <linux-cachefs@redhat.com>; Mon, 17 May 2021 23:53:04 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-338-Tu3DjjQIMZeQHuY-HQPE9A-1; Mon, 17 May 2021 19:53:02 -0400
X-MC-Unique: Tu3DjjQIMZeQHuY-HQPE9A-1
Received: from dread.disaster.area (pa49-195-118-180.pa.nsw.optusnet.com.au
	[49.195.118.180])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 2AE1E86326F;
	Tue, 18 May 2021 09:22:38 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1limZJ-002Bw0-76; Tue, 18 May 2021 09:22:37 +1000
Date: Tue, 18 May 2021 09:22:37 +1000
From: Dave Chinner <david@fromorbit.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210517232237.GE2893@dread.disaster.area>
References: <206078.1621264018@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <206078.1621264018@warthog.procyon.org.uk>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0
	a=xcwBwyABtj18PbVNKPPJDQ==:117 a=xcwBwyABtj18PbVNKPPJDQ==:17
	a=kj9zAlcOel0A:10 a=5FLXtPjwQuUA:10 a=7-415B0cAAAA:8
	a=C_5rSjyteTE79hNBMgUA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 17, 2021 at 04:06:58PM +0100, David Howells wrote:
> Hi,
> 
> With filesystems like ext4, xfs and btrfs, what are the limits on directory
> capacity, and how well are they indexed?
> 
> The reason I ask is that inside of cachefiles, I insert fanout directories
> inside index directories to divide up the space for ext2 to cope with the
> limits on directory sizes and that it did linear searches (IIRC).

Don't do that for XFS. XFS directories have internal hashed btree
indexes that are far more space efficient than using fanout in
userspace. i.e. The XFS hash index uses 8 bytes per dirent, and so
in a 4kB directory block size structure can index about 500 entries
per block. And being O(log N) for lookup, insert and remove, the
fan-out within the directory hash per IO operation is an aorder of
magnitude higher than using directories in userspace....

The capacity limit for XFS is 32GB of dirent data, which generally
equates to somewhere around 300-500 million dirents depending on
filename size. The hash index is separate from this limit (has it's
own 32GB address segment, as does the internal freespace map for the
directory....

The other directory design characterisitic of XFs directories is
that readdir is always a sequential read through the dirent data
with built in readahead. It does not need to look up the hash index
to determine where to read the next dirents from - that's a straight
"file offset to physical location" lookup in the extent btree, which
is always cached in memory. So that's generally not a limiting
factor, either.

> For some applications, I need to be able to cache over 1M entries (render
> farm) and even a kernel tree has over 100k.

Not a problem for XFS with a single directory, but could definitely
be a problem for others especially as the directory grows and
shrinks. Last I measured, ext4 directory perf drops off at about
80-90k entries using 40 byte file names, but you can get an idea of
XFS directory scalability with large entry counts in commit
756c6f0f7efe ("xfs: reverse search directory freespace indexes").
I'll reproduce the table using a 4kB directory block size here:

     File count	      create time(sec) / rate (files/s)
      10k			  0.41 / 24.3k
      20k			  0.75 / 26.7k
     100k			  3.27 / 30.6k
     200k			  6.71 / 29.8k
       1M			 37.67 / 26.5k
       2M			 79.55 / 25.2k
      10M			552.89 / 18.1k

So that's single threaded file create, which shows the rough limits
of insert into the large directory. There really isn't a major
drop-off in performance until there are several million entries in
the directory. Remove is roughly the same speed for the same dirent
count.

> What I'd like to do is remove the fanout directories, so that for each logical
> "volume"[*] I have a single directory with all the files in it.  But that
> means sticking massive amounts of entries into a single directory and hoping
> it (a) isn't too slow and (b) doesn't hit the capacity limit.

Note that if you use a single directory, you are effectively single
threading modifications to your file index. You still need to use
fanout directories if you want concurrency during modification for
the cachefiles index, but that's a different design criteria
compared to directory capacity and modification/lookup scalability.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

