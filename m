Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 05675270724
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Sep 2020 22:36:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-HJdSbK-TMGuU2sR_Fb2SWQ-1; Fri, 18 Sep 2020 16:36:13 -0400
X-MC-Unique: HJdSbK-TMGuU2sR_Fb2SWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 296971007480;
	Fri, 18 Sep 2020 20:36:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 186061001281;
	Fri, 18 Sep 2020 20:36:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CD308C7C9;
	Fri, 18 Sep 2020 20:36:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088B6pOC002506 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 07:06:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A50FC110F0DD; Tue,  8 Sep 2020 11:06:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA2C110F0D8
	for <linux-cachefs@redhat.com>; Tue,  8 Sep 2020 11:06:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66629101A540
	for <linux-cachefs@redhat.com>; Tue,  8 Sep 2020 11:06:48 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-554-x4_2518-N5eECTJnf6HrZw-1;
	Tue, 08 Sep 2020 07:06:46 -0400
X-MC-Unique: x4_2518-N5eECTJnf6HrZw-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id 38ACB1DB1282;
	Tue,  8 Sep 2020 12:06:45 +0100 (BST)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g2eLEF3P0BXr; Tue,  8 Sep 2020 12:06:45 +0100 (BST)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id 05B239C88F3;
	Tue,  8 Sep 2020 12:06:45 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 41AD881475E6;
	Tue,  8 Sep 2020 12:06:44 +0100 (BST)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id yhNO6k2_G9XV; Tue,  8 Sep 2020 12:06:44 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 249968146AFC;
	Tue,  8 Sep 2020 12:06:44 +0100 (BST)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Fe0ZnO9CPmRQ; Tue,  8 Sep 2020 12:06:44 +0100 (BST)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 0CE2281475E6;
	Tue,  8 Sep 2020 12:06:44 +0100 (BST)
Date: Tue, 8 Sep 2020 12:06:44 +0100 (BST)
From: Daire Byrne <daire@dneg.com>
To: "Mkrtchyan, Tigran" <tigran.mkrtchyan@desy.de>
Message-ID: <767326930.31952012.1599563204539.JavaMail.zimbra@dneg.com>
In-Reply-To: <1642729052.4237865.1599558047149.JavaMail.zimbra@desy.de>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1642729052.4237865.1599558047149.JavaMail.zimbra@desy.de>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR5PHKb0Pjd1zDnQ=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 18 Sep 2020 16:35:29 -0400
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Tigran,

I guess I never really considered overlayfs because we still want to seamlessly write through to the original servers from time to time and post processing the copies from upper to lower seems like it might be hard to make reliable or do with low latency? I would also worry that our lower filesystem is being actively updated by processes outside of the overlay clients and how overlayfs would deal with that. And ultimately, the COW nature of overlayfs is a somewhat wasted feature for our workloads whereby it's the caching of file reads (and metadata) we care most about.

I must confess to not having looked at overlayfs in a few years so there may be lots of new tricks and options that would help our case. I'm aware that it gained the ability to NFS (re-)export a couple of years back.

But I'm certainly now interested to know if that NFS re-export implementation fares any better with the issues I experience with a direct knfsd re-export of an NFS client. So I will do some testing with overlayfs and see how it stacks up (see what I did there?).

Thanks for the suggestion!

Daire

----- On 8 Sep, 2020, at 10:40, Mkrtchyan, Tigran tigran.mkrtchyan@desy.de wrote:

> Just out of curiosity:
> 
> did you have tries instead of re-exporting nfs mount directly
> re-export an overlayfs mount on top of the original nfs mount?
> Such setup should cover most of your issues.
> 
> Regards,
>   Tigran.
> 
> ----- Original Message -----
>> From: "Daire Byrne" <daire@dneg.com>
>> To: "linux-nfs" <linux-nfs@vger.kernel.org>
>> Cc: linux-cachefs@redhat.com
>> Sent: Monday, September 7, 2020 7:31:00 PM
>> Subject: Adventures in NFS re-exporting
> 
>> Hi,
>> 
>> Apologies for this rather long email, but I thought there may be some interest
>> out there in the community in how and why we've been doing something
>> unsupported and barely documented - NFS re-exporting! And I'm not sure I can
>> tell our story well in just a few short sentences so please bear with me (or
>> stop now!).
>> 
>> Full disclosure - I am also rather hoping that this story piques some interest
>> amongst developers to help make our rather niche setup even better and perhaps
>> a little better documented. I also totally understand if this is something
>> people wouldn't want to touch with a very long barge pole....
>> 
>> First a quick bit of history (I hope I have this right). Late in 2015, Jeff
>> Layton proposed a patch series allowing knfsd to re-export a NFS client mount.
>> The rationale then was to provide a "proxy" server that could mount an NFSv4
>> only server and re-export it to older clients that only supported NFSv3. One of
>> the main sticking points then (as now), was around the 63 byte limit of
>> filehandles for NFSv3 and how it couldn't be guaranteed that all re-exported
>> filehandles would fit within that (in my experience it mostly works with
>> "no_subtree_check"). There are also the usual locking and coherence concerns
>> with NFSv3 too but I'll get to that in a bit.
>> 
>> Then almost two years later, v4.13 was released including parts of the patch
>> series that actually allowed the re-export and since then other relevant bits
>> (such as the open file cache) have also been merged. I soon became interested
>> in using this new functionality to both accelerate our on-premises NFS storage
>> and use it as a "WAN cache" to provide cloud compute instances locally cached
>> proxy access to our on-premises storage.
>> 
>> Cut to a brief introduction to us and what we do... DNEG is an award winning VFX
>> company which uses large compute farms to generate complex final frame renders
>> for movies and TV. This workload mostly consists of reads of common data shared
>> between many render clients (e.g textures, geometry) and a little unique data
>> per frame. All file writes are to unique files per process (frames) and there
>> is very little if any writing over existing files. Hence it's not very
>> demanding on locking and coherence guarantees.
>> 
>> When our on-premises NFS storage is being overloaded or the server's network is
>> maxed out, we can place multiple re-export servers in between them and our farm
>> to improve performance. When our on-premises render farm is not quite big
>> enough to meet a deadline, we spin up compute instances with a (reasonably
>> local) cloud provider. Some of these cloud instances are Linux NFS servers
>> which mount our on-premises NFS storage servers (~10ms away) and re-export
>> these to the other cloud (render) instances. Since we know that the data we are
>> reading doesn't change often, we can increase the actimeo and even use nocto to
>> reduce the network chatter back to the on-prem servers. These re-export servers
>> also use fscache/cachefiles to cache data to disk so that we can retain TBs of
>> previously read data locally in the cloud over long periods of time. We also
>> use NFSv4 (less network chatter) all the way from our on-prem storage to the
>> re-export server and then on to the clients.
>> 
>> The re-export server(s) quickly builds up both a memory cache and disk backed
>> fscache/cachefiles storage cache of our working data set so the data being
>> pulled from on-prem lessens over time. Data is only ever read once over the WAN
>> network from on-prem storage and then read multiple times by the many render
>> client instances in the cloud. Recent NFS features such as "nconnect" help to
>> speed up the initial reading of data from on-prem by using multiple connections
>> to offset TCP latency. At the end of the render, we write the files back
>> through the re-export server to our on-prem storage. Our average read bandwidth
>> is many times higher than our write bandwidth.
>> 
>> Rather surprisingly, this mostly works for our particular workloads. We've
>> completed movies using this setup and saved money on commercial caching systems
>> (e.g Avere, GPFS, etc). But there are still some remaining issues with doing
>> something that is very much not widely supported (or recommended). In most
>> cases we have worked around them, but it would be great if we didn't have to so
>> others could also benefit. I will list the main problems quickly now and
>> provide more information and reproducers later if anyone is interested.
>> 
>> 1) The kernel can drop entries out of the NFS client inode cache (under memory
>> cache churn) when those filehandles are still being used by the knfsd's remote
>> clients resulting in sporadic and random stale filehandles. This seems to be
>> mostly for directories from what I've seen. Does the NFS client not know that
>> knfsd is still using those files/dirs? The workaround is to never drop inode &
>> dentry caches on the re-export servers (vfs_cache_pressure=1). This also helps
>> to ensure that we actually make the most of our actimeo=3600,nocto mount
>> options for the full specified time.
>> 
>> 2) If we cache metadata on the re-export server using actimeo=3600,nocto we can
>> cut the network packets back to the origin server to zero for repeated lookups.
>> However, if a client of the re-export server walks paths and memory maps those
>> files (i.e. loading an application), the re-export server starts issuing
>> unexpected calls back to the origin server again, ignoring/invalidating the
>> re-export server's NFS client cache. We worked around this this by patching an
>> inode/iversion validity check in inode.c so that the NFS client cache on the
>> re-export server is used. I'm not sure about the correctness of this patch but
>> it works for our corner case.
>> 
>> 3) If we saturate an NFS client's network with reads from the server, all client
>> metadata lookups become unbearably slow even if it's all cached in the NFS
>> client's memory and no network RPCs should be required. This is the case for
>> any NFS client regardless of re-exporting but it affects this case more because
>> when we can't serve cached metadata we also can't serve the cached data. It
>> feels like some sort of bottleneck in the client's ability to parallelise
>> requests? We work around this by not maxing out our network.
>> 
>> 4) With an NFSv4 re-export, lots of open/close requests (hundreds per second)
>> quickly eat up the CPU on the re-export server and perf top shows we are mostly
>> in native_queued_spin_lock_slowpath. Does NFSv4 also need an open file cache
>> like that added to NFSv3? Our workaround is to either fix the thing doing lots
>> of repeated open/closes or use NFSv3 instead.
>> 
>> If you made it this far, I've probably taken up way too much of your valuable
>> time already. If nobody is interested in this rather niche application of the
>> Linux client & knfsd, then I totally understand and I will not mention it here
>> again. If your interest is piqued however, I'm happy to go into more detail
>> about any of this with the hope that this could become a better documented and
>> understood type of setup that others with similar workloads could reference.
>> 
>> Also, many thanks to all the Linux NFS developers for the amazing work you do
>> which, in turn, helps us to make great movies. :)
>> 
> > Daire (Head of Systems DNEG)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

