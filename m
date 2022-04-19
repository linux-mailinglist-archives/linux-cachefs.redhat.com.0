Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D4507370
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 18:41:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-wvAiiQCGN9-s8Pm5YEOezQ-1; Tue, 19 Apr 2022 12:41:55 -0400
X-MC-Unique: wvAiiQCGN9-s8Pm5YEOezQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B09C86B8A1;
	Tue, 19 Apr 2022 16:41:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B627C52D98;
	Tue, 19 Apr 2022 16:41:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5BE01940342;
	Tue, 19 Apr 2022 16:41:50 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 61F6D1947BBF for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 16:41:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EAB340CF917; Tue, 19 Apr 2022 16:41:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A58440CF8FA
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 16:41:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3230A1C08DA3
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 16:41:49 +0000 (UTC)
Received: from nibbler.cm4all.net (nibbler.cm4all.net [82.165.145.151]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-bXGFIh3QMNOHCnlO7CW8-A-1; Tue, 19 Apr 2022 12:41:47 -0400
X-MC-Unique: bXGFIh3QMNOHCnlO7CW8-A-1
Received: from localhost (localhost [127.0.0.1])
 by nibbler.cm4all.net (Postfix) with ESMTP id 31B77C00A1
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 18:41:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at nibbler.cm4all.net
Received: from nibbler.cm4all.net ([127.0.0.1])
 by localhost (nibbler.cm4all.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id pPuE8Cahsqyf for <linux-cachefs@redhat.com>;
 Tue, 19 Apr 2022 18:41:39 +0200 (CEST)
Received: from zero.intern.cm-ag (zero.intern.cm-ag [172.30.16.10])
 by nibbler.cm4all.net (Postfix) with SMTP id 14170C00B9
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 18:41:39 +0200 (CEST)
Received: (qmail 29906 invoked from network); 19 Apr 2022 22:31:40 +0200
Received: from unknown (HELO rabbit.intern.cm-ag) (172.30.3.1)
 by zero.intern.cm-ag with SMTP; 19 Apr 2022 22:31:40 +0200
Received: by rabbit.intern.cm-ag (Postfix, from userid 1023)
 id D8786460EFB; Tue, 19 Apr 2022 18:41:38 +0200 (CEST)
Date: Tue, 19 Apr 2022 18:41:38 +0200
From: Max Kellermann <mk@cm4all.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <Yl7mQr05hPg4vELb@rabbit.intern.cm-ag>
References: <Yl7EyMLnqqDv63yW@rabbit.intern.cm-ag>
 <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <454834.1650373340@warthog.procyon.org.uk>
 <508603.1650385022@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <508603.1650385022@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] fscache corruption in Linux 5.17?
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 Max Kellermann <mk@cm4all.com>, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/04/19 18:17, David Howells <dhowells@redhat.com> wrote:
> 	find /var/cache/fscache -inum $((0xiiii))
> 
> and see if you can see the corruption in there.  Note that there may be blocks
> of zeroes corresponding to unfetched file blocks.

I checked several known-corrupt files, but unfortunately, all
corruption have disappeared :-(

The /var/cache/fscache/ files have a time stamp half an hour ago
(17:53 CET = 15:53 GMT).  I don't know what happened at that time -
too bad this disappeared after a week, just when we started
investigating it.

All those new files are all-zero.  No data is stored in any of them.

Note that I had to enable
/sys/kernel/debug/tracing/events/cachefiles/enable; the trace events
you named (read/write/trunc/io_error/vfs_error) do not emit anything.
This is what I see:

  kworker/u98:11-1446185 [016] ..... 1813913.318370: cachefiles_ref: c=00014bd5 o=12080f1c u=1 NEW obj
  kworker/u98:11-1446185 [016] ..... 1813913.318379: cachefiles_lookup: o=12080f1c dB=3e01ee B=3e5580 e=0
  kworker/u98:11-1446185 [016] ..... 1813913.318380: cachefiles_mark_active: o=12080f1c B=3e5580
  kworker/u98:11-1446185 [016] ..... 1813913.318401: cachefiles_coherency: o=12080f1c OK       B=3e5580 c=0
  kworker/u98:11-1446185 [016] ..... 1813913.318402: cachefiles_ref: c=00014bd5 o=12080f1c u=1 SEE lookup_cookie

> Also, what filesystem is backing your cachefiles cache?  It could be useful to
> dump the extent list of the file.  You should be able to do this with
> "filefrag -e".

It's ext4.

 Filesystem type is: ef53
 File size of /var/cache/fscache/cache/Infs,3.0,2,,a4214ac,c0000208,,,3002c0,10000,10000,12c,1770,bb8,1770,1/@58/T,c0000208,,1cf4167,184558d9,c0000208,,40,36bab37,40, is 188416 (46 blocks of 4096 bytes)
 /var/cache/fscache/cache/Infs,3.0,2,,a4214ac,c0000208,,,3002c0,10000,10000,12c,1770,bb8,1770,1/@58/T,c0000208,,1cf4167,184558d9,c0000208,,40,36bab37,40,: 0 extents found
 File size of /var/cache/fscache/cache/Infs,3.0,2,,a4214ac,c0000208,,,3002c0,10000,10000,12c,1770,bb8,1770,1/@ea/T,c0000208,,10cc976,1208c7f6,c0000208,,40,36bab37,40, is 114688 (28 blocks of 4096 bytes)
 /var/cache/fscache/cache/Infs,3.0,2,,a4214ac,c0000208,,,3002c0,10000,10000,12c,1770,bb8,1770,1/@ea/T,c0000208,,10cc976,1208c7f6,c0000208,,40,36bab37,40,: 0 extents found

> As to why this happens, a write that's misaligned by 31 bytes should cause DIO
> to a disk to fail - so it shouldn't be possible to write that.  However, I'm
> doing fallocate and truncate on the file to shape it so that DIO will work on
> it, so it's possible that there's a bug there.  The cachefiles_trunc trace
> lines may help catch that.

I don't think any write is misaligned.  This was triggered by a
WordPress update, so I think the WordPress updater truncated and
rewrote all files.  Random guess: some pages got transferred to the
NFS server, but the local copy in fscache did not get updated.

Max

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

