Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F6CD6D1
	for <lists+linux-cachefs@lfdr.de>; Sun,  6 Oct 2019 19:51:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2715659465;
	Sun,  6 Oct 2019 17:51:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E23F260C05;
	Sun,  6 Oct 2019 17:51:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 028291803518;
	Sun,  6 Oct 2019 17:51:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x96HpDZT021216 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 6 Oct 2019 13:51:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F17660127; Sun,  6 Oct 2019 17:51:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09AE5600C8
	for <linux-cachefs@redhat.com>; Sun,  6 Oct 2019 17:51:10 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F080418C8911
	for <linux-cachefs@redhat.com>; Sun,  6 Oct 2019 17:51:09 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 205so7154579pfw.2
	for <linux-cachefs@redhat.com>; Sun, 06 Oct 2019 10:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:to;
	bh=88HqJ6GnUXw7ahrmtDN1ifCJ9uuyQSoD8vT/axn+cYo=;
	b=Y7XXToRAhOuvITpBQsUtDAMAoY+vioO/hQ3djA0QzYjsxtNs1Hj69I2V00ztClUPzt
	eLydtVOYWhKH2rcBADzvRm32hXVQSUGHe/AZD6I+I4hEogYKqcQE5ewlINQOfVZqu2H6
	zetRuPRharSqhGiakeBWomb1BF8/pXynTlWCmT+ZwzIkSX6OOcnMs9ht6ju6zAVTCfp/
	WBTNRnR2sAfJ/9WlkL/d7xMxmkcXvKfsTBwHx/8jaQbRN35Jr9K8al7Hctb9BQFTScEE
	+IMfjJrAjgirWuUY2cG5W9RCHQFlSVQzIUh4cthL53fOJKCPfoy2qcgWojLECV0nQ1BK
	PUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
	bh=88HqJ6GnUXw7ahrmtDN1ifCJ9uuyQSoD8vT/axn+cYo=;
	b=TpjZR37wWVarFOjlzZFrqMrze7Lm42JJxK/0RIBhh39JYUwaVZdETWTtfL7CWkTpoh
	wVFIlDgQyeRd5FpVV0hC0Hs7Zq6c+Af70ah8K5Z3L1wUKhDcRJ+kI/fcCO51gRjwMDhE
	SkEFXTa4nAb1yxTgQ1e+ToabBlBkqp4R/10AYcVoPGGYZIhAGJd79X9ngeFYPY0OC0a/
	Dsb9wnZRXefzIVHNV4085BCUdFGJyFXLbhEPfOky2kb5gOuDzpSFl34OKQeINKAbdSQc
	xZN6ghGS98wiKa6SX0KwLMzmDXHQjl7uyLxJAfi/8PsOhTJGzlEWYYyQ5+ZnyGaJJlne
	cLeQ==
X-Gm-Message-State: APjAAAVxJpquVcGU7KgVXPehIgHcmJjk1SzFiDK6UOfAQCPRv8S0G+Gk
	swXreJ7Pw421JSR5fzPyvum0GOe8
X-Google-Smtp-Source: APXvYqyB0mXwROe2uTfjnf/GKfmFQQHmRBguQGf7OVtoC72uAyoTYd0xowQYT8V0OxG90ThTXogJTQ==
X-Received: by 2002:a17:90a:65c8:: with SMTP id
	i8mr28520908pjs.51.1570384268713; 
	Sun, 06 Oct 2019 10:51:08 -0700 (PDT)
Received: from ?IPv6:2601:602:8000:188:b456:2625:9656:fe4b?
	([2601:602:8000:188:b456:2625:9656:fe4b])
	by smtp.gmail.com with ESMTPSA id 2sm12764428pfo.91.2019.10.06.10.51.07
	for <linux-cachefs@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Oct 2019 10:51:07 -0700 (PDT)
From: jake buchholz <tomalok@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <CEECFFB3-8A63-4475-B7B9-C78AA6C7CB12@gmail.com>
Date: Sun, 6 Oct 2019 10:51:07 -0700
To: linux-cachefs@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Sun, 06 Oct 2019 17:51:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Sun, 06 Oct 2019 17:51:10 +0000 (UTC) for IP:'209.85.210.173'
	DOMAIN:'mail-pf1-f173.google.com'
	HELO:'mail-pf1-f173.google.com' FROM:'tomalok@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.098  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.173 mail-pf1-f173.google.com 209.85.210.173
	mail-pf1-f173.google.com <tomalok@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Linux-cachefs] cachefilesd-inotify
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Sun, 06 Oct 2019 17:51:24 +0000 (UTC)

SeKAmXZlIHVwZGF0ZWQgdGhlIGNhY2hlZmlsZXNkIHVzZXJzcGFjZSBkYWVtb24gdG8gdXNlIElO
T1RJRlkgaW5zdGVhZCBvZiB0aGUgZGVwcmVjYXRlZCBETk9USUZZLgoKTm90IHN1cmUgd2hhdCB0
aGUgcHJvY2VzcyBtaWdodCBiZSB0byBnZXQgaXQgb2ZmaWNpYWxseSBtZXJnZWQsIGJ1dCBJ4oCZ
dmUgZ290IGEgcGF0Y2hlZCBmb3JrIGF2YWlsYWJsZSBhdCBodHRwczovL2dpdGxhYi5jb20vdG9t
YWxvay9jYWNoZWZpbGVzZC1pbm90aWZ5IDxodHRwczovL2dpdGxhYi5jb20vdG9tYWxvay9jYWNo
ZWZpbGVzZC1pbm90aWZ5PiBmb3IgcmV2aWV3L2NvbnNpZGVyYXRpb24uCgpUaGFua3MsCmpha2UK
LS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz
