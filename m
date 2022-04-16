Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF525503812
	for <lists+linux-cachefs@lfdr.de>; Sat, 16 Apr 2022 21:56:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-LbQ75u9nM72zkDEG7KrYOg-1; Sat, 16 Apr 2022 15:56:12 -0400
X-MC-Unique: LbQ75u9nM72zkDEG7KrYOg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9877E85A5BC;
	Sat, 16 Apr 2022 19:56:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43CCD463EFB;
	Sat, 16 Apr 2022 19:56:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 77A931947BBB;
	Sat, 16 Apr 2022 19:56:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 088F119466DF for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 16 Apr 2022 19:56:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A45F1145CB69; Sat, 16 Apr 2022 19:56:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0907145CB63
 for <linux-cachefs@redhat.com>; Sat, 16 Apr 2022 19:56:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2D2185A7A4
 for <linux-cachefs@redhat.com>; Sat, 16 Apr 2022 19:56:05 +0000 (UTC)
Received: from nibbler.cm4all.net (nibbler.cm4all.net [82.165.145.151]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-DLin77V2NPO_n4OvMTStAQ-1; Sat, 16 Apr 2022 15:56:03 -0400
X-MC-Unique: DLin77V2NPO_n4OvMTStAQ-1
Received: from localhost (localhost [127.0.0.1])
 by nibbler.cm4all.net (Postfix) with ESMTP id D8946C0071
 for <linux-cachefs@redhat.com>; Sat, 16 Apr 2022 21:56:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at nibbler.cm4all.net
Received: from nibbler.cm4all.net ([127.0.0.1])
 by localhost (nibbler.cm4all.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id L2M4rUNh9dpN for <linux-cachefs@redhat.com>;
 Sat, 16 Apr 2022 21:55:54 +0200 (CEST)
Received: from zero.intern.cm-ag (zero.intern.cm-ag [172.30.16.10])
 by nibbler.cm4all.net (Postfix) with SMTP id BA379C00B9
 for <linux-cachefs@redhat.com>; Sat, 16 Apr 2022 21:55:54 +0200 (CEST)
Received: (qmail 4335 invoked from network); 17 Apr 2022 01:45:20 +0200
Received: from unknown (HELO rabbit.intern.cm-ag) (172.30.3.1)
 by zero.intern.cm-ag with SMTP; 17 Apr 2022 01:45:20 +0200
Received: by rabbit.intern.cm-ag (Postfix, from userid 1023)
 id 86426460E36; Sat, 16 Apr 2022 21:55:54 +0200 (CEST)
Date: Sat, 16 Apr 2022 21:55:54 +0200
From: Max Kellermann <mk@cm4all.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Message-ID: <YlsfSqysfKJqwDVz@rabbit.intern.cm-ag>
References: <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <c6b80014-846d-cd90-7e67-d72959ffabe1@leemhuis.info>
MIME-Version: 1.0
In-Reply-To: <c6b80014-846d-cd90-7e67-d72959ffabe1@leemhuis.info>
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
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, Max Kellermann <mk@cm4all.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/04/16 13:38, Thorsten Leemhuis <regressions@leemhuis.info> wrote:
> Thx for the report. Maybe a bisection is what's needed here, but lets
> see what David says, maybe he has a idea already.

I wish I could do that, but it's very hard to reproduce; the first
reports came after a week or so.  That way, a bisect would take
months.  So yes, wait for David, because he might give a clue how to
trigger the problem more quickly to make a bisect practical.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

