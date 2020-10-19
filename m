Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B58D1292B4E
	for <lists+linux-cachefs@lfdr.de>; Mon, 19 Oct 2020 18:20:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-NGGe7UF-OcO2ZWtRtw3fLw-1; Mon, 19 Oct 2020 12:20:01 -0400
X-MC-Unique: NGGe7UF-OcO2ZWtRtw3fLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44CE910A0B82;
	Mon, 19 Oct 2020 16:19:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB43610013C1;
	Mon, 19 Oct 2020 16:19:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 690AC181A86E;
	Mon, 19 Oct 2020 16:19:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JGJoHF001942 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 12:19:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81E262156A37; Mon, 19 Oct 2020 16:19:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C9842166B28
	for <linux-cachefs@redhat.com>; Mon, 19 Oct 2020 16:19:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E2858007A4
	for <linux-cachefs@redhat.com>; Mon, 19 Oct 2020 16:19:48 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-318-68hjTkuLOVC_qghOQtRtIg-1;
	Mon, 19 Oct 2020 12:19:45 -0400
X-MC-Unique: 68hjTkuLOVC_qghOQtRtIg-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id 75FB7C35A2;
	Mon, 19 Oct 2020 17:19:44 +0100 (BST)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Fj7w7u61iTFb; Mon, 19 Oct 2020 17:19:44 +0100 (BST)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id 5463DB3F851;
	Mon, 19 Oct 2020 17:19:44 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 439438177FF1;
	Mon, 19 Oct 2020 17:19:44 +0100 (BST)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id cOaINGZQurbY; Mon, 19 Oct 2020 17:19:44 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id B8F3A8177B84;
	Mon, 19 Oct 2020 17:19:43 +0100 (BST)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IK2PflamYvtl; Mon, 19 Oct 2020 17:19:43 +0100 (BST)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id A0D278177FFB;
	Mon, 19 Oct 2020 17:19:43 +0100 (BST)
Date: Mon, 19 Oct 2020 17:19:43 +0100 (BST)
From: Daire Byrne <daire@dneg.com>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
In-Reply-To: <1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4BeKhpLVGiQL7pU
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
Cc: bfields <bfields@fieldses.org>, linux-nfs <linux-nfs@vger.kernel.org>,
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


----- On 16 Sep, 2020, at 17:01, Daire Byrne daire@dneg.com wrote:

> Trond/Bruce,
> 
> ----- On 15 Sep, 2020, at 20:59, Trond Myklebust trondmy@hammerspace.com wrote:
> 
>> On Tue, 2020-09-15 at 13:21 -0400, J. Bruce Fields wrote:
>>> On Mon, Sep 07, 2020 at 06:31:00PM +0100, Daire Byrne wrote:
>>> > 1) The kernel can drop entries out of the NFS client inode cache
>>> > (under memory cache churn) when those filehandles are still being
>>> > used by the knfsd's remote clients resulting in sporadic and random
>>> > stale filehandles. This seems to be mostly for directories from
>>> > what I've seen. Does the NFS client not know that knfsd is still
>>> > using those files/dirs? The workaround is to never drop inode &
>>> > dentry caches on the re-export servers (vfs_cache_pressure=1). This
>>> > also helps to ensure that we actually make the most of our
>>> > actimeo=3600,nocto mount options for the full specified time.
>>> 
>>> I thought reexport worked by embedding the original server's
>>> filehandles
>>> in the filehandles given out by the reexporting server.
>>> 
>>> So, even if nothing's cached, when the reexporting server gets a
>>> filehandle, it should be able to extract the original filehandle from
>>> it
>>> and use that.
>>> 
>>> I wonder why that's not working?
>> 
>> NFSv3? If so, I suspect it is because we never wrote a lookupp()
>> callback for it.
> 
> So in terms of the ESTALE counter on the reexport server, we see it increase if
> the end client mounts the reexport using either NFSv3 or NFSv4. But there is a
> difference in the client experience in that with NFSv3 we quickly get
> input/output errors but with NFSv4 we don't. But it does seem like the
> performance drops significantly which makes me think that NFSv4 retries the
> lookups (which succeed) when an ESTALE is reported but NFSv3 does not?
> 
> This is the simplest reproducer I could come up with but it may still be
> specific to our workloads/applications and hard to replicate exactly.
> 
> nfs-client # sudo mount -t nfs -o vers=3,actimeo=5,ro
> reexport-server:/vol/software /mnt/software
> nfs-client # while true; do /mnt/software/bin/application; echo 3 | sudo tee
> /proc/sys/vm/drop_caches; done
> 
> reexport-server # sysctl -w vm.vfs_cache_pressure=100
> reexport-server # while true; do echo 3 > /proc/sys/vm/drop_caches ; done
> reexport-server # while true; do awk '/fh/ {print $2}' /proc/net/rpc/nfsd; sleep
> 10; done
> 
> Where "application" is some big application with lots of paths to scan with libs
> to memory map and "/vol/software" is an NFS mount on the reexport-server from
> another originating NFS server. I don't know why this application loading
> workload shows this best, but perhaps the access patterns of memory mapped
> binaries and libs is particularly susceptible to estale?
> 
> With vfs_cache_pressure=100, running "echo 3 > /proc/sys/vm/drop_caches"
> repeatedly on the reexport server drops chunks of the dentry & nfs_inode_cache.
> The ESTALE count increases and the client running the application reports
> input/output errors with NFSv3 or the loading slows to a crawl with NFSv4.
> 
> As soon as we switch to vfs_cache_pressure=0, the repeating drop_caches on the
> reexport server do not cull the dentry or nfs_inode_cache, the ESTALE counter
> no longer increases and the client experiences no issues (NFSv3 & NFSv4).

I don't suppose anyone has any more thoughts on this one? This is likely the first problem that anyone trying to NFS re-export is going to encounter. If they re-export NFSv3 they'll just get lots of ESTALE as the nfs inodes are dropped from cache (with the default vfs_cache_pressure=100) and if they re-export NFSv4, the lookup performance will drop significantly as an ESTALE triggers re-lookups.

For our particular use case, it is actually desirable to have vfs_cache_pressure=0 to keep nfs client inodes and dentry caches in memory to help with expensive metadata lookups, but it would still be nice to have the option of using a less drastic setting (such as vfs_cache_pressure=1) to help avoid OOM conditions.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

