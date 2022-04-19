Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04450729C
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 18:06:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-wOKJsp94OOm0G2EDxAkg2Q-1; Tue, 19 Apr 2022 12:06:33 -0400
X-MC-Unique: wOKJsp94OOm0G2EDxAkg2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2ACD18812C0;
	Tue, 19 Apr 2022 16:06:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97BB5176F6;
	Tue, 19 Apr 2022 16:06:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4D3A71940340;
	Tue, 19 Apr 2022 16:06:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE12F1947BBF for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 16:06:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9D2BA1400AFB; Tue, 19 Apr 2022 16:06:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 998861400C2D
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 16:06:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F8B11018AA4
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 16:06:30 +0000 (UTC)
Received: from nibbler.cm4all.net (nibbler.cm4all.net [82.165.145.151]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-WZIb5BI1PA6Rm86hkUAHRw-1; Tue, 19 Apr 2022 12:06:28 -0400
X-MC-Unique: WZIb5BI1PA6Rm86hkUAHRw-1
Received: from localhost (localhost [127.0.0.1])
 by nibbler.cm4all.net (Postfix) with ESMTP id 1E8E5C00B9
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 18:06:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at nibbler.cm4all.net
Received: from nibbler.cm4all.net ([127.0.0.1])
 by localhost (nibbler.cm4all.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 5QrDbSBrpT0h for <linux-cachefs@redhat.com>;
 Tue, 19 Apr 2022 18:06:20 +0200 (CEST)
Received: from zero.intern.cm-ag (zero.intern.cm-ag [172.30.16.10])
 by nibbler.cm4all.net (Postfix) with SMTP id 00D66C00D5
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 18:06:19 +0200 (CEST)
Received: (qmail 26839 invoked from network); 19 Apr 2022 21:56:21 +0200
Received: from unknown (HELO rabbit.intern.cm-ag) (172.30.3.1)
 by zero.intern.cm-ag with SMTP; 19 Apr 2022 21:56:21 +0200
Received: by rabbit.intern.cm-ag (Postfix, from userid 1023)
 id C913A460F19; Tue, 19 Apr 2022 18:06:19 +0200 (CEST)
Date: Tue, 19 Apr 2022 18:06:19 +0200
From: Max Kellermann <mk@cm4all.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <Yl7d++G25sNXIR+p@rabbit.intern.cm-ag>
References: <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <507518.1650383808@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <507518.1650383808@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/04/19 17:56, David Howells <dhowells@redhat.com> wrote:
> This is weird.  It looks like content got slid down by 31 bytes and 31 zero
> bytes got added at the end.  I'm not sure how fscache would achieve that -
> nfs's implementation should only be dealing with pages.

Did you read this part of my email?:

On 2022/04/12 17:10, Max Kellermann <max@rabbit.intern.cm-ag> wrote:
> The corruption can be explained by WordPress commit
> https://github.com/WordPress/WordPress/commit/07855db0ee8d5cff2 which
> makes the file 31 bytes longer (185055 -> 185086).  The "broken" web
> server sees the new contents until offset 184320 (= 45 * 4096), but
> sees the old contents from there on; followed by 31 null bytes
> (because the kernel reads past the end of the cache?).

My theory was that fscache shows a mix of old and new pages after the
file was modified.  Does this make sense?

Is there anything I can do to give you data from this server's cache?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

