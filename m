Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE8507BE8
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 23:27:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-aTqYnimaOG-q4UX7xjvfhQ-1; Tue, 19 Apr 2022 17:27:52 -0400
X-MC-Unique: aTqYnimaOG-q4UX7xjvfhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CBA71C05AB1;
	Tue, 19 Apr 2022 21:27:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82765111C4BE;
	Tue, 19 Apr 2022 21:27:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 645021949763;
	Tue, 19 Apr 2022 21:27:50 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 54E4819451F2 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 21:27:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0333C8179; Tue, 19 Apr 2022 21:27:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F34BE17338
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 21:27:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92F6A833960
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 21:27:45 +0000 (UTC)
Received: from nibbler.cm4all.net (nibbler.cm4all.net [82.165.145.151]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-oIic4kABN7SKg3IbAqPWvQ-1; Tue, 19 Apr 2022 17:27:41 -0400
X-MC-Unique: oIic4kABN7SKg3IbAqPWvQ-1
Received: from localhost (localhost [127.0.0.1])
 by nibbler.cm4all.net (Postfix) with ESMTP id 686C2C00A1
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 23:27:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at nibbler.cm4all.net
Received: from nibbler.cm4all.net ([127.0.0.1])
 by localhost (nibbler.cm4all.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Tb-KvG3ZUWTp for <linux-cachefs@redhat.com>;
 Tue, 19 Apr 2022 23:27:33 +0200 (CEST)
Received: from zero.intern.cm-ag (zero.intern.cm-ag [172.30.16.10])
 by nibbler.cm4all.net (Postfix) with SMTP id 464ECC00B9
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 23:27:33 +0200 (CEST)
Received: (qmail 17150 invoked from network); 20 Apr 2022 03:17:38 +0200
Received: from unknown (HELO rabbit.intern.cm-ag) (172.30.3.1)
 by zero.intern.cm-ag with SMTP; 20 Apr 2022 03:17:38 +0200
Received: by rabbit.intern.cm-ag (Postfix, from userid 1023)
 id 1563E460F19; Tue, 19 Apr 2022 23:27:33 +0200 (CEST)
Date: Tue, 19 Apr 2022 23:27:33 +0200
From: Max Kellermann <mk@cm4all.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <Yl8pRVSW9y1o6MBV@rabbit.intern.cm-ag>
References: <Yl7d++G25sNXIR+p@rabbit.intern.cm-ag>
 <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <507518.1650383808@warthog.procyon.org.uk>
 <509961.1650386569@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <509961.1650386569@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/04/19 18:42, David Howells <dhowells@redhat.com> wrote:
> Could the file have been modified by a third party?  If you're using NFS3
> there's a problem if two clients can modify a file at the same time.  The
> second write can mask the first write and the client has no way to detect it.
> The problem is inherent to the protocol design.  The NFS2 and NFS3 protocols
> don't support anything better than {ctime,mtime,filesize} - the change
> attribute only becomes available with NFS4.

I tried to write a script to stress-test writing and reading, but
found no clue so far.  I'll continue that tomorrow.

My latest theory is that this is a race condition; what if one process
writes to the file, which invalidates the cache; then, in the middle
of invalidating the local cache and sending the write to the NFS
server, another process (on the same server) reads the file; what
modification time and what data will it see?  What if the cache gets
filled with old data, while new data to-be-written is still in flight?

Max

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

