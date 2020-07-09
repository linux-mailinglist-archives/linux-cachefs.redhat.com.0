Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9D00421A650
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Jul 2020 19:50:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-DwNHbjr_NUqda-yFYlifPA-1; Thu, 09 Jul 2020 13:50:36 -0400
X-MC-Unique: DwNHbjr_NUqda-yFYlifPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF151100AA21;
	Thu,  9 Jul 2020 17:50:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED56C5BAEA;
	Thu,  9 Jul 2020 17:50:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 95D8784353;
	Thu,  9 Jul 2020 17:50:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069HhSGc018082 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 13:43:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90E242097D60; Thu,  9 Jul 2020 17:43:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 716D82097D61
	for <linux-cachefs@redhat.com>; Thu,  9 Jul 2020 17:43:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B8468007DB
	for <linux-cachefs@redhat.com>; Thu,  9 Jul 2020 17:43:25 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-474-a1UrrMRQNjqwA2xsgjiwJA-1; Thu, 09 Jul 2020 13:43:21 -0400
X-MC-Unique: a1UrrMRQNjqwA2xsgjiwJA-1
Received: by mail-wr1-f68.google.com with SMTP id j4so3266597wrp.10
	for <linux-cachefs@redhat.com>; Thu, 09 Jul 2020 10:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CVDqH630IMtBJFWWNlkhH2rarVDEtjIfgVBYz5EVe1g=;
	b=mEx9pfk9zcIiTm6i8BC4M4wNjQj4jhPqIbTujrXunoZbblRJDge3mZWeFWMJa6lfwe
	M6JYlDZr/q7Z2VaLlTmfQE4WOgbWq3odiIMdssTe4yBxtHH506KfHFa+i/l/MxZbIleA
	8AHGYfOeTgJ+CPIQBwP5xYYeyADdvbHoJ/P6pfoVdHvRX1lHOxvc8tHbcQ8xVqXEga6r
	lu3TC/b7J0/SpD2FB+B/TD8FFL0Vnel6q1TIehj+IS91lVDrW2GG2VVc1PerrvUZ6zUK
	jj5HTFIBjFggnK7SYcJEevMe+TLg966ReHzv6+XSw1qRSOco7STL/kjTFm9aICRwztt8
	PD4A==
X-Gm-Message-State: AOAM533GR9om5wRyhnhWuFvEVMjHYeCTZzzYqg0cBKvdatfT3/hUc91m
	jT62pgisDSBTg980yRkmfa6By7QjUDLXWA+uyRY7WPQD
X-Google-Smtp-Source: ABdhPJxIGf8TVxvoVnH8Gd8qbrjZJh6MTEpgZ62izWKg7pMP2r0Sy9mQ8u/vGbevCj5jjoJLINqNoNv2ROZQvshDhfQ=
X-Received: by 2002:adf:ed8c:: with SMTP id c12mr30770395wro.359.1594316599347;
	Thu, 09 Jul 2020 10:43:19 -0700 (PDT)
MIME-Version: 1.0
From: Daire Byrne <daire.byrne@gmail.com>
Date: Thu, 9 Jul 2020 18:43:08 +0100
Message-ID: <CAB3bAB80-EcCuxA_hy45gc8f7sBVO3yuN5r-2pjN7XWuATR+tw@mail.gmail.com>
To: linux-cachefs@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Linux-cachefs] resume_thresholds cachefilesd.conf not supported?
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I am trying to keep NFS client inodes and dentry caches in memory for as
long as possible using /proc/sys/vm/vfs_cache_pressure = 1.

One side-effect of this is that the culling runs in cachefilesd seem to be
suspended until a certain number of files (or blocks) are ejected from
cache? I believe this is reduce the number of culling iterations and only
run when we think there might be some files to clear up?

But if we never drop anything from inode/dentry cache, then we want to run
culling periodically and not rely on the count of recently freed inodes
(otherwise nothing will happen).

I believe this functionality was introduced here:

https://kernel.googlesource.com/pub/scm/linux/kernel/git/dhowells/cachefilesd/+/4f881c327573cce04977c116330d0a9e05366c60%5E%21/#F2

But the actual cachefilesd.conf keyword (described in the docs/man/config)
doesn't seem to work (or I am using it wrong). Setting "resume_thresholds -
-" or even "resume_thresholds 10 10" just results in an error:

cachefilesd[55348]: /etc/cachefilesd.conf:21:CacheFiles gave config error:
Operation not supported

I'm using the RHEL7 supplied cachefilesd v0.10.9.

I might try editing the cachefilesd code to set "f_resume_threshold
= ULLONG_MAX" (instead of the default "5") and recompile to see if that
disables this functionality and helps culling with my vfs_cache_pressue = 1
case.

Daire
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

