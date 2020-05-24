Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 683BF1E21C7
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 May 2020 14:25:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590495943;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s7A4hd+9eAJXal5jQoYWsN1HI1in7Ckchwx7oNo8hiU=;
	b=TeY6DL009Un0UwiLB2b9E4EKvJmNwP2B5Gs1FTm2lydtxb56Is7e/b/bXE1I7Rgv2bx0HV
	fOYUkN/9JSvULsGnT3szyySnJWW1P47ca0PbTMdNtw8OBsFk+7bNp1Jb9ewWSlbl9SDAH3
	3/wpETVXdDT39LJ+uAlbaPlBw3fCPgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-6jdsAeXRM32WYXT9yV_xZg-1; Tue, 26 May 2020 08:25:41 -0400
X-MC-Unique: 6jdsAeXRM32WYXT9yV_xZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A33361B18BC5;
	Tue, 26 May 2020 12:25:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91DBB79C50;
	Tue, 26 May 2020 12:25:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0278654D3A;
	Tue, 26 May 2020 12:25:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04OAscT6008140 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 06:54:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D50FD2EF9A; Sun, 24 May 2020 10:54:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9C822EF9D
	for <linux-cachefs@redhat.com>; Sun, 24 May 2020 10:54:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D9908007A4
	for <linux-cachefs@redhat.com>; Sun, 24 May 2020 10:54:34 +0000 (UTC)
Received: from vader.hardeman.nu (vader.hardeman.nu [95.142.160.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-142-ApMRRaaeM5ibNAxzWRI2Tw-1; Sun, 24 May 2020 06:54:30 -0400
X-MC-Unique: ApMRRaaeM5ibNAxzWRI2Tw-1
MIME-Version: 1.0
Date: Sun, 24 May 2020 10:48:21 +0000
From: "=?utf-8?B?RGF2aWQgSMOkcmRlbWFu?=" <david@hardeman.nu>
Message-ID: <10a52dff816fb300e459bd320890d32d@hardeman.nu>
To: linux-cachefs@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04OAscT6008140
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 26 May 2020 08:25:31 -0400
Subject: [Linux-cachefs] cachefilesd refuses to cache NFS exports/mounts
	with fsid = 0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I've been trying to setup fscache for an NFS share by following various online guides but the client refused to enable the FSC for some reason (client = Debian Unstable, Linux 5.6.0; server = Debian Stable, Linux 4.19.0-8).

After a lot of trial and error, I discovered that the caching is enabled as long as the fsid is not zero.

Is this expected behavior and, if so, shouldn't it be documented somewhere?

Cheers,
David


Test summary
============

(root@server:/etc/exports.d)$ cat srv.exports 
# Note: /srv is a separate partition
/srv	<IPv6 ULA>::/64(sec=krb5:krb5i:krb5p,rw,async,crossmnt,no_subtree_check,root_squash)

(root@server:/etc/exports.d)$ exportfs -ra

(root@client:~)$ mount -t nfs4 server:/ /mnt/tmp -o sec=krb5,fsc

(root@client:~)$ cat /proc/fs/nfsfs/*
NV SERVER             PORT USE HOSTNAME
v4 <server IPv6 addr>  801   1 server
NV SERVER             PORT DEV          FSID                              FSC
v4 <server IPv6 addr>  801 0:70         0:0                               no 

(user@client:~)$ cat /mnt/tmp/srv/somedir/somefile.txt &> /dev/null

(root@client:~)$ cat /proc/fs/nfsfs/*
NV SERVER             PORT USE HOSTNAME
v4 <server IPv6 addr>  801   1 server
NV SERVER             PORT DEV          FSID                              FSC
v4 <server IPv6 addr>  801 0:70         0:0                               no 
v4 <server IPv6 addr>  801 0:73         7a26f4d97cd54396:9fffb68912b8d546 yes

(root@client:~)$ umount /mnt/tmp

(root@client:~)$ mount -t nfs4 server:/srv /mnt/tmp -o sec=krb5,fsc

(root@client:~)$ cat /proc/fs/nfsfs/*
NV SERVER             PORT USE HOSTNAME
v4 <server IPv6 addr>  801   1 server
NV SERVER             PORT DEV          FSID                              FSC
v4 <server IPv6 addr>  801 0:73         7a26f4d97cd54396:9fffb68912b8d546 yes

(root@client:~)$ umount /mnt/tmp

(root@server:/etc/exports.d)$ vi srv.exports 

(root@server:/etc/exports.d)$ cat srv.exports 
# Note: /srv is a separate partition
/srv	<IPv6 ULA>::/64(sec=krb5:krb5i:krb5p,rw,async,crossmnt,no_subtree_check,root_squash,fsid=0)

(root@server:/etc/exports.d)$ exportfs -ra

(root@client:~)$ mount -t nfs4 server:/ /mnt/tmp -o sec=krb5,fsc

(root@client:~)$ cat /proc/fs/nfsfs/*
NV SERVER             PORT USE HOSTNAME
v4 <server IPv6 addr>  801   1 server
NV SERVER             PORT DEV          FSID                              FSC
v4 <server IPv6 addr>  801 0:70         0:0                               no 

(user@client:~)$ cat /mnt/tmp/somedir/somefile.txt &> /dev/null

(root@client:~)$ cat /proc/fs/nfsfs/*
NV SERVER             PORT USE HOSTNAME
v4 <server IPv6 addr>  801   1 server
NV SERVER             PORT DEV          FSID                              FSC
v4 <server IPv6 addr>  801 0:70         0:0                               no


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

